// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "Modules", targets: ["Modules"]),
    ],
    dependencies: [
        .package(name: "SparrowKit", url: "https://github.com/ivanvorobei/SparrowKit", .upToNextMajor(from: "3.6.1")),
        .package(name: "PermissionsKit", path: "PermissionsKit")
    ],
    targets: [
        .target(
            name: "Modules",
            dependencies: [
                .product(name: "SparrowKit", package: "SparrowKit"),
                .product(name: "CameraPermission", package: "PermissionsKit"),
                .product(name: "PhotoLibraryPermission", package: "PermissionsKit"),
                .product(name: "NotificationPermission", package: "PermissionsKit"),
                .product(name: "MicrophonePermission", package: "PermissionsKit"),
                .product(name: "CalendarPermission", package: "PermissionsKit"),
                .product(name: "ContactsPermission", package: "PermissionsKit"),
                .product(name: "RemindersPermission", package: "PermissionsKit"),
                .product(name: "SpeechRecognizerPermission", package: "PermissionsKit"),
                .product(name: "LocationWhenInUsePermission", package: "PermissionsKit"),
                .product(name: "LocationAlwaysPermission", package: "PermissionsKit"),
                .product(name: "MotionPermission", package: "PermissionsKit"),
                .product(name: "MediaLibraryPermission", package: "PermissionsKit"),
                .product(name: "BluetoothPermission", package: "PermissionsKit"),
                .product(name: "TrackingPermission", package: "PermissionsKit"),
                .product(name: "FaceIDPermission", package: "PermissionsKit"),
                .product(name: "SiriPermission", package: "PermissionsKit"),
                .product(name: "HealthPermission", package: "PermissionsKit")
            ]
        ),
    ]
)
