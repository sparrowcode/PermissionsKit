// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SPPermissions",
    platforms: [
       .iOS(.v11), .tvOS(.v11)
    ],
    products: [
        .library(name: "SPPermissions", targets: ["SPPermissions"])
    ],
    targets: [
        .target(name: "SPPermissions")
    ]
)
