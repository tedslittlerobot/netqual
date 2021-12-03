import Foundation
import NQScanner

extension NQTScheduleRules {
    public class SlowAndTimeHasPassed: NQTScheduleRule {
        let dlThreshold: Int
        let ulThreshold: Int
        let minutes: Int

        public init(dlThreshold: Int, ulThreshold: Int, minutes: Int) {
            self.dlThreshold = dlThreshold
            self.ulThreshold = ulThreshold
            self.minutes = minutes
        }

        public func shouldScan(previous: NQScan?) -> Bool {
            guard let previous = previous else { return false }

            if previous.dlThroughput.bytes < (dlThreshold * 1024 * 1024) { return true }
            if previous.ulThroughput.bytes < (ulThreshold * 1024 * 1024) { return true }

            return false
        }

        public func reason(previous: NQScan?) -> String { "Speed is below threshold - DL: \(dlThreshold) Mbps UL: \(ulThreshold) Mbps" }
    }
}
