import Foundation

public enum ScalableValue: Int, Codable {
    case unit = 0
    case kilo = 1
    case mega = 2
    case giga = 3

    public enum DisplayStyle { case short, long }

    public func convert(_ unit: Int) -> Float {
        let scale = powf(Float(1024), Float(self.rawValue))

        return Float(unit) / scale
    }

    public func unit(style: DisplayStyle) -> String {
        switch self {
            case .unit:
                return style == .short ? "" : ""
            case .kilo:
                return style == .short ? "K" : "Kilo"
            case .mega:
                return style == .short ? "M" : "Mega"
            case .giga:
                return style == .short ? "G" : "Giga"
        }
    }

    public func display(_ value: Int, suffix: String = "", style: DisplayStyle = .short) -> String {
        let scaled = convert(value)

        return "\(String(format: "%.2f", scaled)) \(unit(style: style))\(suffix)"
    }

    public static var all: [ScalableValue] {
        return [.unit, .kilo, .mega, .giga]
    }

    public static func unitRange(_ value: Int, suffix: String = "", style: DisplayStyle = .short) -> [String] {
        return all.map {
            $0.display(value, suffix: suffix, style: style)
        }
    }

    public static func mostAppropriateUnit(_ value: Int) -> ScalableValue {
        all.first { $0.convert(value) < 1024 } ?? .giga
    }
}

