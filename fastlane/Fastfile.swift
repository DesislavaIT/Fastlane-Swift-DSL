// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func xcarchiveWithoutDSLLane() {
		desc("The way xcarchive was created before Custom DSL.")
        
        gym(
            clean: true,
            configuration: "Debug",
            skipPackageIpa: true,
            exportMethod: "development",
            buildPath: "simulator_build_without_DSL"
        )
	}
    
    func xcarchiveLane() {
        desc("The way xcarchive is created with Custom DSL.")
        
        LaneRunner(output: .xcarchive) {
            GymConfiguration.debug
            GymExportMethod.development
            "simulator_build"
        }.run()
    }
    
    func buildIpaWithoutDSLLane() {
        desc("The way IPA file was created before Custom DSL.")
        
        gym(
            clean: true,
            outputDirectory: "IPA_without_DSL",
            configuration: "Debug",
            exportMethod: "development",
            buildPath: "simulator_build_without_DSL"
        )
    }
    
    func buildIpaLane() {
        desc("The way IPA file is created with Custom DSL.")
        
        LaneRunner(output: .ipa) {
            "IPA"
            GymConfiguration.debug
            GymExportMethod.development
            "simulator_build"
        }.run()
    }
}
