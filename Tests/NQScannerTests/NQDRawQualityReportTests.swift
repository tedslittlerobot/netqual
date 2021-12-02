import XCTest
import class Foundation.Bundle
import NQScanner

final class NQScanTests: XCTestCase {
    static let passingSample = """
    {
      "dl_flows" : 20,
      "dl_throughput" : 5814456,
      "lud_foreign_h2_req_resp" : [
        665,
        1703,
        1700,
        1704,
        1695,
        2095,
        4750,
        5456
      ],
      "lud_foreign_tcp_handshake_443" : [
        868,
        855,
        866,
        858,
        855,
        858,
        855,
        870
      ],
      "lud_self_ul_h2" : [
        726.39501953125,
        2538.903076171875,
        1538.9639892578125,
        605.8310546875,
        1952.7769775390625,
        1035.2091064453125,
        2428.985107421875,
        1429.8160400390625,
        706.00604248046875,
        5327.68115234375,
        4327.7529296875,
        3330.93994140625,
        2331.39404296875,
        1329.471923828125,
        1244.5670166015625
      ],
      "responsiveness" : 36,
      "ul_flows" : 20,
      "ul_throughput" : 1117925
    }
    """

    static let erroringSample = """
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

    func testDecodeFromPassingJson() throws {
        let decoder = JSONDecoder()
        let scan = try! decoder.decode(NQScan.self, from: NQScanTests.passingSample.data(using: .utf8)!)

        XCTAssertEqual(.pass, scan.status)
    }

    func testDecodeFromErroringSample() throws {
        let decoder = JSONDecoder()
        let scan = try! decoder.decode(NQScan.self, from: NQScanTests.erroringSample.data(using: .utf8)!)

        XCTAssertEqual(.error, scan.status)
    }
}
