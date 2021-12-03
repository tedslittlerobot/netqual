import Foundation

extension NQScan {
    public struct NetworkSpeed {
        public let bytes: Int

        public func display(style: ScalableValue.DisplayStyle = .short) -> String {
            let suffix = style == .short ? "bps" : " bits per second"

            return ScalableValue.mostAppropriateUnit(bytes).display(bytes, suffix: suffix, style: style)
        }
    }
}
