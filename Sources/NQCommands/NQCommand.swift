import Foundation
import SwiftCLI
import Rainbow

public class NQCommand {
    public init() {}

    func write(header string: String, to stdout: WritableStream) {
        let padding = "    "
        let header = "\(padding)Network Quality: \(string)\(padding)"

        stdout <<< "".padding(toLength: header.count, withPad: "=", startingAt: 0).blue
        stdout <<< header.cyan
        stdout <<< "".padding(toLength: header.count, withPad: "=", startingAt: 0).blue
        stdout <<< ""
    }

    func write(label: String, value: String, to stdout: WritableStream) {
        stdout <<< "\("\(label):".lightYellow) \(value.magenta.bold)"
    }
}
