import Foundation
import NQScanner

public class NQTimeline: Codable {
    public internal(set) var scans: [NQScan]
    public internal(set) var failures: [String]

    internal init(scans: [NQScan], failures: [String]) {
        self.scans = scans
        self.failures = failures
    }

    @discardableResult
    public func scan() -> NQScan {
        let scan = NQScan.scan

        self.scans.append(scan)

        return scan
    }

    public var latest: NQScan? { scans.last }

    public var errors: [NQScan] {
        scans.filter { $0.status != .pass }
    }

    public static var fresh: NQTimeline {
        NQTimeline(scans: [], failures: [])
    }
}
