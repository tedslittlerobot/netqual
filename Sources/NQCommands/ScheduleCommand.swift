import Foundation
import SwiftCLI
import NQScanner
import NQStorage
import Rainbow
import NQTimetable

public class ScheduleCommand: NQCommand, Command {
    public let name = "schedule"
    public let shortDescription = "Run a scan if it should be run based on a scheduler"

    public func execute() throws  {
        write(header: "Run Schedule", to: stdout)

        let storage = try! NQStorage.load()

        let timeline = storage.timeline

        if let rule = shouldScan(storage: storage) {
            stdout <<< "Scanning because: \(rule.reason(previous: timeline.latest))".cyan

            timeline.scan()
            storage.persist()

            display(scan: timeline.latest!)
        } else {
            stdout <<< "Not Scanning: No matching rules".red
        }
    }

    func shouldScan(storage: NQStorage) -> NQTScheduleRule? {
        let scan = storage.timeline.latest

        return rules(storage: storage).first {
            $0.shouldScan(previous: scan)
        }
    }

    func rules(storage: NQStorage) -> [NQTScheduleRule] {
        let rules: [NQTScheduleRule] = [
            NQTScheduleRules.NoPreviousScans(),
            NQTScheduleRules.TimeHasPassed(minutes: storage.config.maxMinuteWait),
        ]

        return rules
    }

    func display(scan: NQScan) {
        write(label: "Download Speed", value: scan.dlThroughput.display(), to: stdout)
        write(label: "Upload Speed", value: scan.ulThroughput.display(), to: stdout)

        if let error = scan.error {
            write(label: "Error", value: error.toString, to: stdout)
        }
    }
}
