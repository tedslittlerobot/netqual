import Foundation
import NQScanner

public protocol NQTScheduleRule {
    func shouldScan(previous: NQScan?) -> Bool
    func reason(previous: NQScan?) -> String
}
