import Foundation
import SwiftCLI
import NQScanner
import NQStorage
import Rainbow

public class ScanCommand: NQCommand, Command {
    public let name = "scan"
    public let shortDescription = "Check your network quality!"

    public func execute() throws  {
        write(header: "Scan", to: stdout)

        let storage = try! NQStorage.load()

        let timeline = storage.timeline
        timeline.scan()

        storage.persist()

        display(scan: timeline.latest!)
    }

    func display(scan: NQScan) {
        write(label: "Download Speed", value: scan.dlThroughput.display(), to: stdout)
        write(label: "Upload Speed", value: scan.ulThroughput.display(), to: stdout)

        if let error = scan.error {
            write(label: "Error", value: error.toString, to: stdout)
        }
    }
}
