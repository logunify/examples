//
//  Worker.swift
//  LogUnify
//
//  Created by Yulong Liu on 2/11/23.
//

import Foundation
import Reachability

public class Worker {
    fileprivate static var instance: Worker?

    fileprivate let lock = NSLock()
    fileprivate let timerTrigger: Int
    fileprivate let batchSize: Int
    fileprivate let sqliteHelper: SqliteHelper
    fileprivate let httpClient: HttpClient
    fileprivate let serialQueue: DispatchQueue
    fileprivate var timer: DispatchSourceTimer
    fileprivate var reachability: Reachability
    fileprivate var isOnline = true

    static func getInstance(
        _ sqliteHelper: SqliteHelper,
        _ httpClient: HttpClient,
        _ timerTrigger: Int,
        _ batchSize: Int) -> Worker? {
        if instance == nil {
            instance = Worker(sqliteHelper, httpClient, timerTrigger, batchSize)
        }
        return instance
    }

    init(_ sqliteHelper: SqliteHelper, _ httpClient: HttpClient, _ timerTrigger: Int, _ batchSize: Int) {
        self.sqliteHelper = sqliteHelper
        self.httpClient = httpClient
        self.timerTrigger = timerTrigger
        self.batchSize = batchSize
        self.serialQueue = DispatchQueue(label: "LogUnify", attributes: [])
        reachability = try! Reachability()

        self.timer = DispatchSource.makeTimerSource(queue: serialQueue)
        timer.schedule(deadline: .now(), repeating: .seconds(timerTrigger), leeway: .seconds(1))

        timer.setEventHandler {
            do {
                try self.handleTimerTick()
            } catch let err {
                NSLog("Error while handling timer tick: \(err)")
            }
        }
        timer.resume()

        reachability.whenReachable = { (reachability) in
            NSLog("Device is online")
            self.isOnline = true
        }
        reachability.whenUnreachable = { (reachability) in
            NSLog("Device is offline")
            self.isOnline = false
        }
        try? reachability.startNotifier()
    }

    public func addEvent(_ event: Event) {
        serialQueue.async {
            do {
                let serializedEvent = try event.serialize().base64EncodedString()

                self.sqliteHelper.addEvent(event: serializedEvent, projectName: event.getProjectName(), schemaName: event.getSchemaName())
                self.sendInBatches()
            } catch {
                NSLog("Error serialize event.")
            }
        }
    }

    private func resetTimer() {
        timer.schedule(deadline: .now(), repeating: .seconds(timerTrigger), leeway: .seconds(1))
    }

    private func handleTimerTick() throws {
        sendInBatches(true)
    }

    private func sendInBatches(_ force: Bool = false) {
        if (!isOnline) {
            NSLog("Device is offline, skip log attempt")
            return;
        }
        lock.lock()
        let backlog = sqliteHelper.size()

        if !force && backlog < batchSize {
            // do not send logs if not enough backlog.
            lock.unlock()
            return
        }

        if backlog == 0 {
            // nothing to send
            lock.unlock()
            return
        }

        NSLog("\(backlog) events in local storage to be sent")
        let batchSize = min(batchSize, backlog)
        let (ids, events) = sqliteHelper.getTopNEvents(n: batchSize)

        self.httpClient.sendRequest(events) { data, response, error in
            if let error = error {
                NSLog("Error while sending request: \(error.localizedDescription)")
                self.lock.unlock()
                return
            }
             if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    NSLog("Error while sending request: \(httpResponse.statusCode)")
                    self.lock.unlock()
                    return
                }
            }

            self.sqliteHelper.removeEvents(ids)
            NSLog("sent \(batchSize) logs, forced: \(force)")
            self.lock.unlock()
        }

    }
}
