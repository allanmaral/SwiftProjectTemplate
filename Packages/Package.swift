// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Main",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .singleTargetLibrary("AppFeature"),
    ],
    dependencies: [
        .package(url: "https://github.com/krzysztofzablocki/Difference.git", exact: "1.0.2"),
        .package(url: "https://github.com/realm/SwiftLint", exact: "0.52.3"),
        .package(url: "https://github.com/krzysztofzablocki/Inject.git", exact: "1.2.4"),
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "Inject",
            ]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                "AppFeature",
                "TestExtensions",
            ]
        ),
        .target(
            name: "TestExtensions",
            dependencies: [
                "Difference",
            ]
        ),
    ]
)

package.targets = package.targets.map { target in
    var plugins = target.plugins ?? []
    plugins.append(.plugin(name: "SwiftLintPlugin", package: "SwiftLint"))
    target.plugins = plugins
    return target
}

extension Product {
    static func singleTargetLibrary(_ name: String) -> Product {
        .library(name: name, targets: [name])
    }
}
