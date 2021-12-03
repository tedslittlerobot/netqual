import Foundation
import NQScanner

extension NQTScheduleRules {
    public class TimeHasPassed: NQTScheduleRule {
        let minutes: Int

        public init(minutes: Int) {
            self.minutes = minutes
        }

        public func shouldScan(previous: NQScan?) -> Bool {
            guard let previous = previous else { return false }

            return Helpers.default.scanHappenedSomeTimeAgo(scan: previous, minutes: minutes)
        }

        public func reason(previous: NQScan?) -> String { "\(minutes) minutes have passed since last scan" }
    }
}
