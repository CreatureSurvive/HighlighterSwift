// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Highlighter",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "Highlighter",
            targets: ["Highlighter"])
    ],
    dependencies: [
        // None
    ],
    targets: [
        .target(
            name: "Highlighter",
            dependencies: [],
            path: "Sources",
            exclude: ["Assets/LICENCE"],
            resources: [
                .copy("Assets/highlight.min.js"),
                .copy("Assets/styles/xcode-default-light.css")            ]),
        .testTarget(
            name: "HighlighterTests",
            dependencies: ["Highlighter"])
    ]
)
