//
//  LogUnifyConfig.swift
//  LogUnify
//
//  Created by Yulong Liu on 2/12/23.
//

import Foundation

public struct LogUnifyConfig {
    // TODO: set a default value for this, use the cloud solution endpoint.
    var serverUrl: String;
    var apiKey: String;
    var maxEvents: Int = 5000;
    var batchSize: Int = 10;
    var timerTrigger: Int = 60;

    public init(_ serverUrl: String,
                apiKey: String,
                maxEvents: Int = 5000,
                batchSize: Int = 10,
                timerTrigger: Int = 60) {
        self.serverUrl = serverUrl
        self.apiKey = apiKey
        self.maxEvents = maxEvents
        self.batchSize = batchSize
        self.timerTrigger = timerTrigger
    }
}
