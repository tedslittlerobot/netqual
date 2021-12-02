import Foundation
import NQTimeline
import Yams

public struct NQConfig: Codable {
    let timelineFile: String

    public init(timelineFile: String) {
        self.timelineFile = timelineFile
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
}
