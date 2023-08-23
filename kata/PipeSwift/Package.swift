// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PipeSwift",
    products: [
        .library(
            name: "PipeSwift",
            targets: ["PipeSwift"]),
    ],
    targets: [
        .target(
            name: "PipeSwift"),
        .testTarget(
            name: "PipeSwiftTests",
            dependencies: ["PipeSwift"]),
    ]
)
