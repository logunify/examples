//
//  LoggingManager.swift
//  LogUnify
//
//  Created by Yulong Liu on 2/11/23.
//

import Foundation

class LoggingManager {
    static var instance: LoggingManager?
    let apiKey: String
    
    public static func getInstance(apiKey: String) -> LoggingManager {
        if instance == nil {
            instance = LoggingManager(apiKey: apiKey)
        }
        return instance!
    }
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func log(event: Event) {
        print("logging event")
    }
}
