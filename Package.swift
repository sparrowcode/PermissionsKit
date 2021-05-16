// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "SPPermissions",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "SPPermissionsCamera",
            targets: ["SPPermissionsCamera"]
        ),
        .library(
            name: "SPPermissionsCalendar",
            targets: ["SPPermissionsCalendar"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SPPermissions"
        ),
        .target(
            name: "SPPermissionsCamera",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_CAMERA"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsCalendar",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_CALENDAR"),
                .define("SPPERMISSIONS_SPM")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
