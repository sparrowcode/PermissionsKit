// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "Dependencies",
            targets: ["Dependencies"]
        ),
    ],
    dependencies: [
        Package.Dependency.package(
            name: "SparrowKit", url: "https://github.com/ivanvorobei/SparrowKit", .branch("main")
        ),
        Package.Dependency.package(
            name: "SPPermissions", path: "SPPermissions"
        )
    ],
    targets: [
        .target(
            name: "Dependencies",
            dependencies: [
                .product(name: "SparrowKit", package: "SparrowKit"),
                .product(name: "SPPermissionsCamera", package: "SPPermissions"),
                .product(name: "SPPermissionsPhotoLibrary", package: "SPPermissions"),
                .product(name: "SPPermissionsNotification", package: "SPPermissions"),
                .product(name: "SPPermissionsMicrophone", package: "SPPermissions"),
                .product(name: "SPPermissionsCalendar", package: "SPPermissions"),
                .product(name: "SPPermissionsContacts", package: "SPPermissions"),
                .product(name: "SPPermissionsReminders", package: "SPPermissions"),
                .product(name: "SPPermissionsSpeechRecognizer", package: "SPPermissions"),
                .product(name: "SPPermissionsLocationWhenInUse", package: "SPPermissions"),
                .product(name: "SPPermissionsLocationAlways", package: "SPPermissions"),
                .product(name: "SPPermissionsMotion", package: "SPPermissions"),
                .product(name: "SPPermissionsMusic", package: "SPPermissions"),
                .product(name: "SPPermissionsBluetooth", package: "SPPermissions"),
                .product(name: "SPPermissionsTracking", package: "SPPermissions"),
                .product(name: "SPPermissionsFaceID", package: "SPPermissions"),
                .product(name: "SPPermissionsSiri", package: "SPPermissions"),
                .product(name: "SPPermissionsHealth", package: "SPPermissions")
            ]
        ),
    ]
)
