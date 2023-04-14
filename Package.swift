// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Spacememo",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Spacememo",
            targets: ["AppModule"],
            bundleIdentifier: "naoki.takahashi.Spacememo",
            teamIdentifier: "CW97U5J24N",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .bowl),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .camera(purposeString: "Unknown Usage Description")
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)