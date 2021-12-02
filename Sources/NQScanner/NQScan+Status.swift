import Foundation

extension NQScan {
    public enum Status {
        case pass, error
    }

    public var status: Status {
        if errorCode == nil {
            return .pass
        }

        return .error
    }
}
