import Foundation
import NQScanner

class Helpers {
    static let `default` = Helpers()

    func scanHappenedSomeTimeAgo(scan: NQScan, minutes: Int) -> Bool {
        // if last scan is > X seconds ago
        let target = Date() - TimeInterval(minutes * 60)

        return scan.timestamp <= target
    }
}
