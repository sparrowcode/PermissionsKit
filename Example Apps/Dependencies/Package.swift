// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v12)
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
                .product(name: "SPPermissionsCalendar", package: "SPPermissions"),
                
            ]
        ),
    ]
)
