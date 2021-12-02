import Foundation

public struct NQScan {
    public let dlFlows: Int
    public let dlThroughput: NetworkSpeed
    public let ulFlows: Int
    public let ulThroughput: NetworkSpeed
    public let responsiveness: Int
    public let errorCode: Int?
    public let errorDomain: String?

    static func runScan() -> String {
        let task = Process()
        let pipe = Pipe()

        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", "networkQuality -c"]
        task.launchPath = "/bin/zsh"
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!

        return output
    }

    public static var scan: NQScan {
        let scanned = runScan()

//        print(scanned)

        let decoder = JSONDecoder()
        return try! decoder.decode(NQScan.self, from: scanned.data(using: .utf8)!)
    }

    public static var sample: NQScan {
        let scanned = """
        {
          "dl_flows" : 0,
          "dl_throughput" : 0,
          "error_code" : -1009,
          "error_domain" : "NSURLErrorDomain",
          "responsiveness" : 0,
          "ul_flows" : 0,
          "ul_throughput" : 0
        }
        """

        let decoder = JSONDecoder()
        return try! decoder.decode(NQScan.self, from: scanned.data(using: .utf8)!)
    }
}
