//
//  LaneRunner.swift
//  FastlaneRunner
//
//  Created by Vasilka Terzieva on 15.06.24.
//  Copyright © 2024 Joshua Liebowitz. All rights reserved.
//

import Foundation

public final class LaneRunner {
    private let actions: [LaneAction]
    
    init(output: GymOutput, @LaneBuilder _ builder: () -> [LaneAction]) {
        LaneBuilder.output = output
        actions = builder()
    }
    
    func run() {
        for action in actions {
            action.run()
        }
    }
}
