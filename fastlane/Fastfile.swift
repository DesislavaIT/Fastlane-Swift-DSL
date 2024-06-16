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
        
        let builder = Builder()
        let actions = builder.xcarchiveLaneBuild()
        let runner = LaneRunner(actions: actions)
        runner.run()
    }
}

public final class Builder {
    @LaneBuilder
    func xcarchiveLaneBuild() -> [LaneAction] {
        GymConfiguration.debug
        GymOutput.xcarchive
        GymExportMethod.development
        "simulator_build"
    }
}