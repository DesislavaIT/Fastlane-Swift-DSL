//
//  LaneRunner.swift
//  FastlaneRunner
//
//  Created by Vasilka Terzieva on 15.06.24.
//  Copyright © 2024 Joshua Liebowitz. All rights reserved.
//

import Foundation

public final class LaneRunner {
    let actions: [LaneAction]
    
    init(actions: [LaneAction]) {
        self.actions = actions
    }
    
    func run() {
        for action in actions {
            action.run()
        }
    }
}
