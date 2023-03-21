//
//  Event.swift
//  LogUnify
//
//  Created by Yulong Liu on 2/11/23.
//

import Foundation

public protocol Event {
    func getSchemaName() -> String;
    func getProjectName() -> String;
    func serialize() throws -> Data;
}

class EventRecord: Codable {
    let serializedEvent: String
    let schemaName: String
    let projectName: String

    init(serializedEvent: String, schemaName: String, projectName: String) {
        self.serializedEvent = serializedEvent
        self.schemaName = schemaName
        self.projectName = projectName
    }
}

class EventRequest: Codable {
    let apiKey: String
    let orgName: String
    let events: [EventRecord]

    init(_ apiKey: String, _ orgName: String, _ events: [EventRecord]) {
        self.apiKey = apiKey
        self.orgName = orgName
        self.events = events
    }
}
