// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoProxy",
    products: [
        .executable(name: "AutoProxy", targets: ["AutoProxy"]),
        .library(name: "AutoProxyModel", targets: ["AutoProxyModel"])
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.8.0"),
        .package(url: "https://github.com/Carthage/Commandant.git", from: "0.17.0")
    ],
    targets: [
        .target(
            name: "AutoProxyModel",
            dependencies: [],
            path: "Sources/Model"),
        .target(
            name: "AutoProxy",
            dependencies: ["AutoProxyModel", "Kitura", "Commandant"],
            path: "Sources/AutoProxy"),
        .testTarget(
            name: "AutoProxyTests",
            dependencies: ["AutoProxyModel"])
    ]
)
