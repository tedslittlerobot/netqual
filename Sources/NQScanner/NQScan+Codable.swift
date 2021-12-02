import Foundation

extension NQScan: Codable {
    enum CodingKeys: String, CodingKey {
        case dl_flows, dl_throughput, ul_flows, ul_throughput, responsiveness, error_code, error_domain
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        dlFlows = try values.decode(Int.self, forKey: .dl_flows)
        dlThroughput = NetworkSpeed(bytes: try values.decode(Int.self, forKey: .dl_throughput))
        ulFlows = try values.decode(Int.self, forKey: .ul_flows)
        ulThroughput = NetworkSpeed(bytes: try values.decode(Int.self, forKey: .ul_throughput))
        responsiveness = try values.decode(Int.self, forKey: .responsiveness)
        errorCode = values.contains(.error_code) ? try values.decode(Int?.self, forKey: .error_code) : nil
        errorDomain = values.contains(.error_domain) ? try values.decode(String?.self, forKey: .error_domain) : nil
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(dlFlows, forKey: .dl_flows)
        try container.encode(dlThroughput.bytes, forKey: .dl_throughput)
        try container.encode(ulFlows, forKey: .ul_flows)
        try container.encode(ulThroughput.bytes, forKey: .ul_throughput)
        try container.encode(responsiveness, forKey: .responsiveness)

        try container.encode(errorCode, forKey: .error_code)
        try container.encode(errorDomain, forKey: .error_domain)
    }
}
