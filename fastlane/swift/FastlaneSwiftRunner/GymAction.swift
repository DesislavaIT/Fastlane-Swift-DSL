//
//  GymAction.swift
//  FastlaneRunner
//
//  Created by Vasilka Terzieva on 15.06.24.
//  Copyright © 2024 Joshua Liebowitz. All rights reserved.
//

import Foundation

public enum GymConfiguration: String {
    case debug = "Debug"
    case release = "Release"
}

public enum GymOutput: String {
    case xcarchive = "xcarchive"
    case ipa = "ipa"
}

public enum GymExportMethod: String {
    case appStore = "app-store"
    case validation = "validation"
    case adHoc = "ad-hoc"
    case package = "package"
    case enterprise = "enterprise"
    case development = "development"
    case developerId = "developer-id"
    case macApplication = "mac-application"
}

public struct GymAction: LaneAction {
    let configuration: GymConfiguration
    let output: GymOutput
    let exportMethod: GymExportMethod
    let buildPath: String
    
    init(@ActionBuilder _ configurationFunc: () -> GymConfiguration = { .debug },
         @ActionBuilder _ output: () -> GymOutput = { .ipa },
         @ActionBuilder _ exportMethodFunc: () -> GymExportMethod = { .development },
         @ActionBuilder _ buildPathFunc: () -> String) {
        self.configuration = configurationFunc()
        self.output = output()
        self.exportMethod = exportMethodFunc()
        self.buildPath = buildPathFunc()
    }
    
    public func run() {
        let configuration = OptionalConfigValue<String?>.init(stringLiteral: self.configuration.rawValue)
        let skipPackageIpa = OptionalConfigValue<Bool>.init(booleanLiteral: output == .xcarchive)
        let exportMethod = OptionalConfigValue<String?>.init(stringLiteral: self.exportMethod.rawValue)
        let buildPath = OptionalConfigValue<String?>.init(stringLiteral: self.buildPath)
        
        gym(
            clean: true,
            configuration: configuration,
            skipPackageIpa: skipPackageIpa,
            exportMethod: exportMethod,
            buildPath: buildPath
        )
    }
}
