// swift-tools-version: 6.3

import PackageDescription

let permissions = [
    "CameraPermission",
    "PhotoLibraryPermission",
    "NotificationPermission",
    "MicrophonePermission",
    "CalendarPermission",
    "ContactsPermission",
    "RemindersPermission",
    "SpeechRecognizerPermission",
    "LocationPermission",
    "MotionPermission",
    "MediaLibraryPermission",
    "BluetoothPermission",
    "TrackingPermission",
    "FaceIDPermission",
    "SiriPermission",
    "HealthPermission"
]

let package = Package(
    name: "PermissionsKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v9),
        .macOS(.v13)
    ],
    products: permissions.map { permission in
        .library(
            name: permission,
            targets: [permission]
        )
    },
    targets: [
        .target(
            name: "PermissionsKit",
            resources: [
                .process("Resources")
            ]
        )
    ] + permissions.map { permission in
        .target(
            name: permission,
            dependencies: [.target(name: "PermissionsKit")]
        )
    },
    swiftLanguageModes: [.v6]
)
