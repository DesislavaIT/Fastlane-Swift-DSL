//
//  LaneBuilder.swift
//  FastlaneRunner
//
//  Created by Vasilka Terzieva on 15.06.24.
//  Copyright © 2024 Joshua Liebowitz. All rights reserved.
//

import Foundation

@resultBuilder
public struct LaneBuilder {
    public static func buildBlock(_ configuration: GymConfiguration = .debug,
                                  _ output: GymOutput = .xcarchive,
                                  _ exportMethod: GymExportMethod = .development,
                                  _ buildPath: String) ->  [LaneAction] {
        let gymAction = GymAction(
            { configuration },
            { output },
            { exportMethod },
            { buildPath }
        )
        
        return [gymAction]
    }
}