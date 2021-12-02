import Foundation
import SwiftCLI
import NQScanner
import NQStorage

public class InfoCommand: NQCommand, Command {
    public let name = "info"
    public let shortDescription = "Get some info on the stored results!"

    public func execute() throws  {
        write(header: "Network Quality Info", to: stdout)

        let storage = try! NQStorage.load()
        let timeline = storage.timeline

        write(label: "Total Scans", value: "\(timeline.scans.count)", to: stdout)
        write(label: "Erroring Scans", value: "\(timeline.errors.count)", to: stdout)
        write(label: "Total Failures", value: "\(timeline.failures.count)", to: stdout)
    }
}
