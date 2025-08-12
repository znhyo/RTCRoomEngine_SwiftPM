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
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", .branch("main")),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "8.3.6498")
    ],
    targets: [

        .binaryTarget(
            name: "RTCRoomEngine",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/3.2/RTCRoomEngine_iOS_3.2.0.840_SDK.zip",
            checksum: "6a2eecb05cd1dd2e9800a2a7758ed6a2f2dde38aec81836751c14cec0fb8fd7f"
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
                .linkedFramework("AVKit"),
                .linkedFramework("AudioToolBox"),
                .linkedFramework("VideoToolBox"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("Accelerate"),
                .linkedFramework("ReplayKit"),
                .linkedFramework("MetalKit"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedLibrary("sqlite3.0"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv")
            ]
        )
    ]
)
