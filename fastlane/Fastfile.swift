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
            configuration: "Debug",          // Use Debug for development, Release for distribution
            skipPackageIpa: true,            // Keep this if you want to skip packaging the .ipa
            exportMethod: "development",     // Change this to the appropriate export method
            buildPath: "simulator_build_without_DSL"    // Path where the build artifacts will be stored
        )
	}
}
