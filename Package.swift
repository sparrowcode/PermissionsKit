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
            name: "SPPermissions",
            targets: ["SPPermissions"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SPPermissions"
        ),
        .target(
            name: "SPPermissionsCamera",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_CAMERA")
            ]
        ),
        .target(
            name: "SPPermissionsContacts",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_CONTACTS")
            ]
        ),
        .target(
            name: "SPPermissionsCalendar",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_CALENDAR")
            ]
        ),
        .target(
            name: "SPPermissionsPhotoLibrary",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_PHOTOLIBRARY")
            ]
        ),
        .target(
            name: "SPPermissionsNotification",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_NOTIFICATION")
            ]
        ),
        .target(
            name: "SPPermissionsMicrophone",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_MICROPHONE")
            ]
        ),
        .target(
            name: "SPPermissionsReminders",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_REMINDERS")
            ]
        ),
        .target(
            name: "SPPermissionsSpeechRecognizer",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_SPEECHRECOGNIZER")
            ]
        ),
        .target(
            name: "SPPermissionsLocation",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_LOCATION")
            ]
        ),
        .target(
            name: "SPPermissionsMotion",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_MOTION")
            ]
        ),
        .target(
            name: "SPPermissionsMediaLibrary",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_MEDIALIBRARY")
            ]
        ),
        .target(
            name: "SPPermissionsBluetooth",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_BLUETOOTH")
            ]
        ),
        .target(
            name: "SPPermissionsTracking",
            dependencies: ["SPPermissions"],
            swiftSettings: [
                .define("SPPERMISSIONS_TRACKING")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
