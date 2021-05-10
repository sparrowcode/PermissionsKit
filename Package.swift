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
            cSettings: [
                .define("SPPERMISSIONS_NOTIFICATIONS", to: "1")
            ]
        ),
        .target(
            name: "PhotoLibrary",
            cSettings: [
                .define("SPPERMISSIONS_PHOTOLIBRARY", to: "1")
            ]
        )
    ]
)
