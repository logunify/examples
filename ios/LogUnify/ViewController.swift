//
//  ViewController.swift
//  LogUnify
//
//  Created by liuyl on 02/10/2023.
//  Copyright (c) 2023 liuyl. All rights reserved.
//

import UIKit
import LogUnify
import Reachability

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = LogUnifyConfig("http://localhost:8081/api/events/_bulk", apiKey: "api_key_1", timerTrigger: 10)
        try! UnifyLogger.initialize(config)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNextClick(_ sender: UIButton) {
        var event = createEvent()
        event.buttonType = ButtonType.next
        event.log()
    }
    
    @IBAction func onPreviousClick(_ sender: UIButton) {
        var event = createEvent()
        event.buttonType = ButtonType.previous
        event.log()
    }
    
    @IBAction func onFabClick(_ sender: UIButton) {
        var event = createEvent()
        event.buttonType = ButtonType.fab
        event.log()
    }
    
    @IBAction func onSettingClick(_ sender: Any) {
        var event = createEvent()
        event.buttonType = ButtonType.settings
        event.log()
    }
    
    @IBAction func onOptionsClick(_ sender: Any) {
        var event = createEvent()
        event.buttonType = ButtonType.options
        event.log()
    }
    
    private func createEvent() -> UserActivity {
        var event = UserActivity.with {
            $0.userID = "iOS App"
            $0.event = Event.click
            $0.sessionID = "iOS Session"
            $0.surface = Surface.screen1
            $0.stringArray = ["a", "b", "c"]
            $0.intArray = [1, 2, 3]
            $0.stringIntMap["key"] = 123
        }
        
        return event;
    }

}

