import Foundation
import SwiftCLI
import Rainbow

public class NQCommand {
    public init() {}

    func write(header string: String, to stdout: WritableStream) {
        stdout <<< string.cyan
        stdout <<< "".padding(toLength: string.count, withPad: "=", startingAt: 0).blue
        stdout <<< ""
    }

    func write(label: String, value: String, to stdout: WritableStream) {
        stdout <<< "\("\(label):".lightYellow) \(value.magenta.bold)"
    }
}
