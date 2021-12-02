import Foundation
import NQTimeline
import Yams

public class NQStorage {
    public var config: NQConfig
    public var timeline: NQTimeline

    internal init(config: NQConfig, timeline: NQTimeline) {
        self.config = config
        self.timeline = timeline
    }

    public static func loadTimeline(from config: NQConfig) throws -> NQTimeline {
        // @todo - if file does not exist, error and prompt to setup

        let decoder = YAMLDecoder()
        return try! decoder.decode(NQTimeline.self, from: String(contentsOfFile: config.timelineFile))
    }

    public static func load() throws -> NQStorage {
        let config = try NQConfig.load()
        let timeline = try loadTimeline(from: config)

        return NQStorage(config: config, timeline: timeline)
    }

    public func persist() {
        Helpers.shared.store(config, to: NQConfig.configFilePath)
        Helpers.shared.store(timeline, to: config.timelineFile)
    }

    public static func initialise(from config: NQConfig) -> NQStorage {
        return NQStorage(config: config, timeline: .fresh)
    }
}
