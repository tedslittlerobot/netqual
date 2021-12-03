import Foundation
import SwiftCLI
import NQScanner
import NQStorage
import Rainbow

public class ResetCommand: NQCommand, Command {
    public let name = "reset"
    public let shortDescription = "Reset your data."

    public func execute() throws  {
        write(header: "Reset", to: stdout)

        let storage = try NQStorage.load()

        stdout <<< "Clearing out old scans...".red

        storage.timeline = .fresh
        storage.persist()

        stdout <<< "Done!".cyan.bold
    }
}
