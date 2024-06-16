//
//  ActionBuilder.swift
//  FastlaneRunner
//
//  Created by Vasilka Terzieva on 15.06.24.
//  Copyright © 2024 Joshua Liebowitz. All rights reserved.
//

import Foundation

@resultBuilder
public struct ActionBuilder {
    public static func buildBlock<T>(_ component: T) -> T {
        return component
    }
}
