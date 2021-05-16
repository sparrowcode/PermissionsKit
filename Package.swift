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
            name: "SPPermissionsPhotoLibrary",
            targets: ["SPPermissionsPhotoLibrary"]
        ),
        .library(
            name: "SPPermissionsNotification",
            targets: ["SPPermissionsNotification"]
        ),
        .library(
            name: "SPPermissionsMicrophone",
            targets: ["SPPermissionsMicrophone"]
        ),
        .library(
            name: "SPPermissionsCalendar",
            targets: ["SPPermissionsCalendar"]
        ),
        .library(
            name: "SPPermissionsContacts",
            targets: ["SPPermissionsContacts"]
        ),
        .library(
            name: "SPPermissionsReminders",
            targets: ["SPPermissionsReminders"]
        ),
        .library(
            name: "SPPermissionsSpeechRecognizer",
            targets: ["SPPermissionsSpeechRecognizer"]
        ),
        .library(
            name: "SPPermissionsLocationWhenInUse",
            targets: ["SPPermissionsLocationWhenInUse"]
        ),
        .library(
            name: "SPPermissionsLocationAlways",
            targets: ["SPPermissionsLocationAlways"]
        ),
        .library(
            name: "SPPermissionsMotion",
            targets: ["SPPermissionsMotion"]
        ),
        .library(
            name: "SPPermissionsMediaLibrary",
            targets: ["SPPermissionsMediaLibrary"]
        ),
        .library(
            name: "SPPermissionsBluetooth",
            targets: ["SPPermissionsBluetooth"]
        ),
        .library(
            name: "SPPermissionsTracking",
            targets: ["SPPermissionsTracking"]
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
            name: "SPPermissionsPhotoLibrary",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_PHOTOLIBRARY"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsNotification",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_NOTIFICATION"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsMicrophone",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_MICROPHONE"),
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
        ),
        .target(
            name: "SPPermissionsContacts",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_CONTACTS"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsReminders",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_REMINDERS"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsSpeechRecognizer",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_SPEECH"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsLocationWhenInUse",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_LOCATION_WHENINUSE"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsLocationAlways",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_LOCATION_ALWAYS"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsMotion",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_MOTION"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsMediaLibrary",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_MEDIALIBRARY"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsBluetooth",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_BLUETOOTH"),
                .define("SPPERMISSIONS_SPM")
            ]
        ),
        .target(
            name: "SPPermissionsTracking",
            dependencies: [.target(name: "SPPermissions")],
            swiftSettings: [
                .define("SPPERMISSIONS_TRACKING"),
                .define("SPPERMISSIONS_SPM")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
