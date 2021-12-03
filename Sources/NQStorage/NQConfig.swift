import Foundation
import NQTimeline
import Yams

public struct NQConfig: Codable {
    public let timelineFile: String
    public let maxMinuteWait: Int

    public init(timelineFile: String) {
        self.timelineFile = timelineFile
        self.maxMinuteWait = NQConfig.default.maxMinuteWait
    }

    init(timelineFile: String, maxMinuteWait: Int) {
        self.timelineFile = timelineFile
        self.maxMinuteWait = maxMinuteWait
    }

    static var configFilePath = Helpers.shared.configDirPath("config.yaml")

    public static func prepare() {
        Helpers.shared.mkdirp(Helpers.shared.configDirPath())
    }

    public static func load() throws -> NQConfig {
        // if config file does not exist, error and prompt to run

        let decoder = YAMLDecoder()
        return try! decoder.decode(NQConfig.self, from: String(contentsOf: configFilePath))
    }

    public static let `default` = NQConfig(timelineFile: "/tmp/netqual.yml", maxMinuteWait: 15)
}
