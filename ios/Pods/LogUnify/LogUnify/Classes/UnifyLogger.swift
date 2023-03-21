//
//  Logger.swift
//  LogUnify
//
//  Created by Yulong Liu on 2/11/23.
//

import Foundation

enum LoggerError: Error {
    case alreadyInitialized
    case notInitialized
}

public class UnifyLogger {
    fileprivate static var instance: UnifyLogger?
    fileprivate let worker: Worker

    public static func initialize(_ config: LogUnifyConfig) throws {
        if instance != nil {
            throw LoggerError.alreadyInitialized
        }
        instance = UnifyLogger(config)
    }

    public static func getInstance() throws -> UnifyLogger {
        if instance == nil {
            throw LoggerError.notInitialized
        }
        return instance!
    }

    init?(_ config: LogUnifyConfig) {
        guard let httpClient = HttpClient(config.serverUrl, config.apiKey) else {
            NSLog("Could not create http client, please check if the URl is valid")
            return nil
        }

        guard let sqliteHelper = SqliteHelper.getInstance() else {
            NSLog("Could not instantiate SQLite instance")
            return nil
        }

        guard let workerInstance = Worker.getInstance(sqliteHelper, httpClient, config.timerTrigger, config.batchSize) else {
            NSLog("Could not create worker instance")
            return nil
        }

        worker = workerInstance
    }

    public func logEvent(_ event: Event) {
        self.worker.addEvent(event)
    }
}
