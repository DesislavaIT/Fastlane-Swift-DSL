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
    var outputDirectory: String = "."
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
    
    init(_ output: GymOutput,
         @ActionBuilder _ configurationFunc: () -> GymConfiguration = { .debug },
         @ActionBuilder _ exportMethodFunc: () -> GymExportMethod = { .development },
         @ActionBuilder _ buildPathFunc: () -> String) {
        self.output = output
        self.configuration = configurationFunc()
        self.exportMethod = exportMethodFunc()
        self.buildPath = buildPathFunc()
    }
    
    init(@ActionBuilder _ outputDirectoryFunc: () -> String,
         @ActionBuilder _ configurationFunc: () -> GymConfiguration = { .debug },
         @ActionBuilder _ output: () -> GymOutput = { .ipa },
         @ActionBuilder _ exportMethodFunc: () -> GymExportMethod = { .development },
         @ActionBuilder _ buildPathFunc: () -> String) {
        self.outputDirectory = outputDirectoryFunc()
        self.configuration = configurationFunc()
        self.output = output()
        self.exportMethod = exportMethodFunc()
        self.buildPath = buildPathFunc()
    }
    
    init(_ output: GymOutput,
         @ActionBuilder _ outputDirectoryFunc: () -> String,
         @ActionBuilder _ configurationFunc: () -> GymConfiguration = { .debug },
         @ActionBuilder _ exportMethodFunc: () -> GymExportMethod = { .development },
         @ActionBuilder _ buildPathFunc: () -> String) {
        self.output = output
        self.outputDirectory = outputDirectoryFunc()
        self.configuration = configurationFunc()
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
            outputDirectory: outputDirectory,
            configuration: configuration,
            skipPackageIpa: skipPackageIpa,
            exportMethod: exportMethod,
            buildPath: buildPath
        )
    }
}
