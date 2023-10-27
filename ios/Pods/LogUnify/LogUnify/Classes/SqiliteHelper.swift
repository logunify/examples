//
//  SqliteEventQueue.swift
//  LogUnify
//
//  Created by Yulong Liu on 2/10/23.
//

import Foundation
import SQLite

public class SqliteHelper {
    static var instance: SqliteHelper?

    var dbPointer: OpaquePointer?

    let DB_VERSION = 2;
    let DB_VERSION_TABLE = "db_version";
    let EVENTS_TABLE = "preflight_events";
    let COLUMN_SERIALIZED_EVENT: String = "serialized_event";
    let COLUMN_PROJECT_NAME: String = "project_name";
    let COLUMN_SCHEMA_NAME: String = "schema_name";
    let DB_FILE = "logUnify.sqlite";
    let MAX_EVENTS = 5000;

    var events: Table?
    var dbVersion: Table?
    var db: Connection?

    let id = Expression<Int64>("id")
    let serializedEvent = Expression<String>("serialized_event")
    let projectName = Expression<String>("project_name")
    let schemaName = Expression<String>("schema_name")
    let version = Expression<Int64>("version")


    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!

    public static func getInstance() -> SqliteHelper? {
        if instance == nil {
            instance = SqliteHelper()
        }

        return instance
    }


    private init?() {
        events = Table(EVENTS_TABLE)
        dbVersion = Table(DB_VERSION_TABLE)
        do {
            db = try Connection("\(path)/logunify.sqlite3")
            try tryCreateEventsTable()
            try tryCreateSchemaTable()
            checkVersion()
        } catch {
            print(error)
            return nil
        }
    }

    public func addEvent(event: String, projectName: String, schemaName: String) {
        do {
            try db?.run(events!.insert(serializedEvent <- event, self.projectName <- projectName, self.schemaName <- schemaName))
            let sz = size()
            if (sz > MAX_EVENTS) {
                NSLog("Event queue size exceeds \(MAX_EVENTS), removing top \(sz - MAX_EVENTS) events")
                removeTopNEvents(n: sz - MAX_EVENTS)
            }
        } catch {
            print(error)
        }
    }

    func getTopNEvents(n: Int) -> (ids: [Int64], events: [EventRecord]) {
        var result: [EventRecord] = []
        var ids: [Int64] = []
        do {
            let query = events!.select(id, serializedEvent, schemaName, projectName).order(id.asc).limit(n)
            for event in try db!.prepare(query) {
                result.append(EventRecord(serializedEvent: event[serializedEvent], schemaName: event[schemaName], projectName: event[projectName]))
                ids.append(event[id])
            }
        } catch {
            print(error)
        }
        return (ids, result)
    }

    func removeEvents(_ ids: [Int64]) {
        NSLog("Removing \(ids.count) events from local storage.")
        do {
            for id in ids {
                try db?.run(events!.filter(self.id == id).delete())
            }
        } catch {
            print(error)
        }
    }

    func removeTopNEvents(n: Int) {
        do {
            let query = events!.select(id).order(id.asc).limit(n)
            var ids: [Int64] = []
            for event in try db!.prepare(query) {
                ids.append(event[id])
            }
            removeEvents(ids)
        } catch {
            print(error)
        }
    }

    public func size() -> Int {
        return try! db!.scalar(events!.count)
    }

    private func tryCreateEventsTable() throws {
         try db?.run(events!.create(ifNotExists: true){ t in
            t.column(id, primaryKey: .autoincrement)
            t.column(serializedEvent)
            t.column(projectName)
            t.column(schemaName)
        })
    }

    private func tryCreateSchemaTable() throws {
        try db?.run(dbVersion!.create(ifNotExists: true){ t in
            t.column(id, primaryKey: .autoincrement)
            t.column(version)
        })
        try db?.run(dbVersion!.insert(version <- Int64(DB_VERSION)))
    }

    private func onMigration() {
        NSLog("onMigration")
        do {
            try db?.transaction {
                try db?.run(events!.drop())
                try db?.run(dbVersion!.drop())
                try tryCreateEventsTable()
                try tryCreateSchemaTable()
            }
        } catch {
            print(error)
        }
    }

    private func checkVersion() {
        let currentVersion = try! db?.pluck(dbVersion!)
        if (currentVersion != nil && currentVersion![version] != DB_VERSION) {
            NSLog("Version mismatch, previous version: \(currentVersion![version]), current version: \(DB_VERSION)")
            onMigration()
        }
    }
}
