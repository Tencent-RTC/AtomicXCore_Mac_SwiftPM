// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "AtomicXCore_Mac",
    platforms: [.macOS(.v11)],
    products: [
        .library(name: "AtomicXCore_Mac",
                 targets: ["AtomicXCore_MacBinary", "AtomicXCore_MacDeps"])
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/TRTC_Mac_SwiftPM.git", from: "13.6.21648"),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "9.1.7824")
    ],
    targets: [
        .binaryTarget(
            name: "AtomicXCore_MacBinary",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/5.3/AtomicXCore_Mac_5.3.1.2_SDK.zip",
            checksum: "a62845022468ecc0c774d0949470e25aa18172b66477c3e3b4f7a4331b4f9339"
        ),
        .target(
            name: "AtomicXCore_MacDeps",
            dependencies: [
                .product(name: "TRTC_Mac_SwiftPM", package: "TRTC_Mac_SwiftPM"),
                .product(name: "TXIMSDK_Plus_Mac", package: "Chat_SDK_SwiftPM")
            ],
            path: "Sources/Deps",
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("AppKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("AVFoundation"),
                .linkedLibrary("c++"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("resolv")
            ]
        )
    ]
)
