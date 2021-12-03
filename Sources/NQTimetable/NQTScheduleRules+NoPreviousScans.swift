import Foundation
import NQScanner

extension NQTScheduleRules {
    public class NoPreviousScans: NQTScheduleRule {
        public init() {}

        public func shouldScan(previous: NQScan?) -> Bool {
            return previous == nil
        }

        public func reason(previous: NQScan?) -> String { "No previous scans" }
    }
}
