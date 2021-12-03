import Foundation
import SwiftCLI
import NQScanner
import NQStorage
import Rainbow

public class SetupCommand: NQCommand, Command {
    public let name = "setup"
    public let shortDescription = "Setup your system."

    @Param var timelineFile: String

    public func execute() throws  {
        write(header: "Setup", to: stdout)

        stdout <<< "Preparing...".yellow

        NQConfig.prepare()
        let config = NQConfig(timelineFile: self.timelineFile)

        if FileManager.default.fileExists(atPath: timelineFile) {
            stderr <<< "A file already exists at the path \(timelineFile.clearStyles.yellow)".red

            stderr <<< "Overwriting config file...".yellow
            let storage = try NQStorage.load()
            storage.config = config
        } else {
            stdout <<< "Writing config and timeline file...".yellow

            let storage = NQStorage.initialise(from: config)
            storage.persist()
        }

        stdout <<< "Done!".cyan.bold
    }
}
