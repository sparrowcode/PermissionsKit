// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SPPermissions",
    platforms: [
       .iOS(.v11)
    ],
    products: [
        .library(name: "SPPermissions", targets: ["SPPermissions"])
    ],
    targets: [
        .target(name: "SPPermissions")
    ]
)
