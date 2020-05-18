// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Viewity",
    platforms: [
        .iOS(.v11),
        // .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Viewity",
            type: .dynamic,
            targets: ["Viewity"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Viewity",
            path: "Sources"
        ),
        .testTarget(
            name: "ViewityTests",
            dependencies: ["Viewity"]
        ),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
