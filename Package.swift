// swift-tools-version:5.10.0

import PackageDescription
import Foundation

let package = Package(
    name: "swift-crypto",
    products: [
        .library(
            name: "Crypto",
            targets: ["Crypto", "Crypto_PrecompiledProduct"]
        ),
        .library(
            name: "_CryptoExtras",
            targets: [
                "_CryptoExtras",
                "CCryptoBoringSSL",
                "CCryptoBoringSSLShims",
                "CryptoBoringWrapper",
                "Crypto",
                "_CryptoExtras_PrecompiledProduct"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/swift-asn1",
            exact: "1.7.1"
        )
    ],
    targets: [
        .binaryTarget(
            name: "CCryptoBoringSSL",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CCryptoBoringSSL-144d5063187dc6e1510ef85d05bc5bef815fbe26a9a310fe72b5f4451e8b57dd.xcframework.zip",
            checksum: "144d5063187dc6e1510ef85d05bc5bef815fbe26a9a310fe72b5f4451e8b57dd"
        ),
        .binaryTarget(
            name: "CCryptoBoringSSLShims",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CCryptoBoringSSLShims-22918d64f5c936e2ce975d4d5eb14e15a52f2a3472846f0a04b252767a821d22.xcframework.zip",
            checksum: "22918d64f5c936e2ce975d4d5eb14e15a52f2a3472846f0a04b252767a821d22"
        ),
        .target(
            name: "Crypto_Aggregation",
            dependencies: ["Crypto"],
            resources: [.copy("PrivacyInfo.xcprivacy")],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Crypto",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/Crypto-e04f22e7c0737304b06cbf28c62c41c3caf6f3dcf8de622ffff4ec86a60f71d8.xcframework.zip",
            checksum: "e04f22e7c0737304b06cbf28c62c41c3caf6f3dcf8de622ffff4ec86a60f71d8"
        ),
        .target(
            name: "_CryptoExtras_Aggregation",
            dependencies: ["_CryptoExtras"],
            resources: [.copy("PrivacyInfo.xcprivacy")],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "_CryptoExtras",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/_CryptoExtras-a463010ef924005f966a254d6a1a04aeb9261b4d6702cde87fc4b25b4b185797.xcframework.zip",
            checksum: "a463010ef924005f966a254d6a1a04aeb9261b4d6702cde87fc4b25b4b185797"
        ),
        .target(
            name: "CryptoBoringWrapper_Aggregation",
            dependencies: ["CryptoBoringWrapper"],
            resources: [.copy("PrivacyInfo.xcprivacy")],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CryptoBoringWrapper",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CryptoBoringWrapper-45a39b62978b70e83fcc9b81c0ff4daac1056afe7e16d905d43d34ba6a19dabd.xcframework.zip",
            checksum: "45a39b62978b70e83fcc9b81c0ff4daac1056afe7e16d905d43d34ba6a19dabd"
        ),
        .target(
            name: "Crypto_PrecompiledProduct",
            dependencies: ["Crypto_Aggregation"],
            packageAccess: false
        ),
        .target(
            name: "_CryptoExtras_PrecompiledProduct",
            dependencies: [
                "_CryptoExtras_Aggregation",
                .product(
                    name: "SwiftASN1",
                    package: "swift-asn1"
                ),
                "CCryptoBoringSSL",
                "CCryptoBoringSSLShims",
                "CryptoBoringWrapper_Aggregation",
                "Crypto_Aggregation"
            ],
            packageAccess: false
        )
    ],
    cxxLanguageStandard: .cxx17
)