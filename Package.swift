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
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CCryptoBoringSSL-d791fe33b68738751c990d7863b0b48bfbde3fc31a68d19da9fde550d58441f0.xcframework.zip",
            checksum: "d791fe33b68738751c990d7863b0b48bfbde3fc31a68d19da9fde550d58441f0"
        ),
        .binaryTarget(
            name: "CCryptoBoringSSLShims",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CCryptoBoringSSLShims-22918d64f5c936e2ce975d4d5eb14e15a52f2a3472846f0a04b252767a821d22.xcframework.zip",
            checksum: "22918d64f5c936e2ce975d4d5eb14e15a52f2a3472846f0a04b252767a821d22"
        ),
        .target(
            name: "Crypto_Aggregation",
            dependencies: ["Crypto"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Crypto",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/Crypto-e8cc3c9e5325dc6e4c0ee10a543c4499b0420fcfc8ec66d15fe9b1b5c13955ac.xcframework.zip",
            checksum: "e8cc3c9e5325dc6e4c0ee10a543c4499b0420fcfc8ec66d15fe9b1b5c13955ac"
        ),
        .target(
            name: "_CryptoExtras_Aggregation",
            dependencies: ["_CryptoExtras"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "_CryptoExtras",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/_CryptoExtras-d18814757f1349edb80c09aba3e979c770b86412488ffa1917818c028c5d2598.xcframework.zip",
            checksum: "d18814757f1349edb80c09aba3e979c770b86412488ffa1917818c028c5d2598"
        ),
        .target(
            name: "CryptoBoringWrapper_Aggregation",
            dependencies: ["CryptoBoringWrapper"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CryptoBoringWrapper",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CryptoBoringWrapper-70d8c9d75b2c881c6aa39f8636647c34a1ee50d7ac46bfd6fb0358e1a57766d1.xcframework.zip",
            checksum: "70d8c9d75b2c881c6aa39f8636647c34a1ee50d7ac46bfd6fb0358e1a57766d1"
        ),
        .target(
            name: "Crypto_PrecompiledProduct",
            dependencies: ["Crypto_Aggregation"]
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
            ]
        )
    ],
    cxxLanguageStandard: .cxx17
)