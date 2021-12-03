import Foundation
import SwiftCLI
import NQScanner
import NQStorage
import Rainbow

public class SetupCommand: NQCommand, Command {
    public let name = "setup"
    public let shortDescription = "Setup your system."

    @Param var timelineFile: String
    @Flag("--force", description: "Delete any existing files in these locations") var force: Bool

    public func execute() throws  {
        write(header: "Setup", to: stdout)

        stdout <<< "Preparing...".yellow

        NQConfig.prepare()

        if FileManager.default.fileExists(atPath: timelineFile) {
            stderr <<< "A file already exists at the path \(timelineFile.clearStyles.yellow)".red
        } else {
            stdout <<< "Writing config and timeline file...".yellow

            let storage = NQStorage.initialise(from: NQConfig(timelineFile: self.timelineFile))
            storage.persist()
        }

        stdout <<< "Done!".cyan.bold
    }
}
