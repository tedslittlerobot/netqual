// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "netqual",
    platforms: [.macOS(.v12)],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.6"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.0"),
        // .package(url: "https://github.com/SwifterSwift/SwifterSwift.git", from: "5.3.0"),
    ],
    targets: [
        .executableTarget(name: "netqual", dependencies: ["NQCommands"]),
        .target(name: "NQCommands", dependencies: ["SwiftCLI", "NQScanner", "NQStorage", "Rainbow"]),
        .target(name: "NQScanner", dependencies: ["SwiftCLI"]),
        .target(name: "NQTimeline", dependencies: ["NQScanner"]),
        .target(name: "NQStorage", dependencies: ["NQTimeline", "Yams"]),
        .testTarget(name: "netqualTests", dependencies: ["netqual"]),
        .testTarget(name: "NQScannerTests", dependencies: ["NQScanner"]),
    ]
)
