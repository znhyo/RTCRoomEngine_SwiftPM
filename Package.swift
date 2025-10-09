// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "RoomEngine",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "RoomEngine",
            targets: ["RoomEngine"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", from: "12.7.0"),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "8.5.6864")
    ],
    targets: [

        .binaryTarget(
            name: "RTCRoomEngine",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/3.3/RTCRoomEngine_iOS_3.3.0.1081_SDK.zip",
            checksum: "5637f6467aadefb375d82e214df856c92ac2129ef643fcfaab2ce46a4ac94799"
        ),
        .target(
            name: "RoomEngine",
            dependencies: [
                .target(name: "RTCRoomEngine"),
                .product(name: "Professional_SwiftPM", package: "Professional_swiftpm"),
                .product(name: "TXLiteAVSDK_ReplayKit", package: "professional_swiftpm"), 
                .product(name: "Chat_SDK_SwiftPM", package: "chat_sdk_swiftpm")
            ],
            sources: ["RoomEngine.swift"],
            linkerSettings: [
                .linkedFramework("AudioToolBox"),
            ]
        )
    ]
)
