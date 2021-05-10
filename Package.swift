// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "SPPermissions",
    platforms: [
        .iOS(.v11), .tvOS(.v11)
    ],
    products: [
        .library(name: "Notifications", targets: ["Notifications"]),
        .library(name: "PhotoLibrary", targets: ["PhotoLibrary"])
    ],
    targets: [
        .target(
            name: "Notifications",
            swiftSettings: [
                .define("SPPERMISSIONS_NOTIFICATIONS")
            ]
        ),
        .target(
            name: "PhotoLibrary",
            swiftSettings: [
                .define("SPPERMISSIONS_PHOTOLIBRARY")
            ]
        )
    ]
)
