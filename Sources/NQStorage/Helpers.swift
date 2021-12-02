import Foundation
import Yams

class Helpers {
    static let shared = Helpers()

    func configDirPath(_ contents: String? = nil) -> URL {
        var url = FileManager.default
            .homeDirectoryForCurrentUser
            .appendingPathComponent(".config/netqual")

        if let contents = contents {
            url.appendPathComponent(contents)
        }

        return url
    }

    func directoryExists(path: String) -> Bool {
        var isDirectory = ObjCBool(true)
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)

        return exists && isDirectory.boolValue
    }

    func mkdirp(_ url: URL) {
        if directoryExists(path: url.path) {
            return
        }

        try! FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
    }

    func store<T: Encodable>(_ data: T, to url: URL) {
        let encoder = YAMLEncoder()
        let encoded = try! encoder.encode(data)

        try! encoded.write(to: url, atomically: true, encoding: .utf8)
    }

    func store<T: Encodable>(_ data: T, to path: String) {
        let encoder = YAMLEncoder()

        let encoded = try! encoder.encode(data)

        try! encoded.write(toFile: path, atomically: true, encoding: .utf8)
    }
}
