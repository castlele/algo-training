// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlignSwift",
    products: [
        .executable(
            name: "AlignSwift",
            targets: ["AlignSwift"]),
    ],
    targets: [
        .executableTarget(
            name: "AlignSwift"),
        .testTarget(
            name: "AlignSwiftTests",
            dependencies: ["AlignSwift"]),
    ]
)
