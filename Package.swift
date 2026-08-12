// swift-tools-version:5.10.0

import PackageDescription
import Foundation

let package = Package(
    name: "swift-crypto",
    products: [
        .library(
            name: "Crypto",
            targets: ["Crypto_PrecompiledProduct"]
        ),
        .library(
            name: "_CryptoExtras",
            targets: ["_CryptoExtras_PrecompiledProduct"]
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
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CCryptoBoringSSL-9b8bf213f563614edf45afc398f3f485320b6dcadf43b3de26475e33803b657f.xcframework.zip",
            checksum: "9b8bf213f563614edf45afc398f3f485320b6dcadf43b3de26475e33803b657f"
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
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/Crypto-ee961f78853eeb051937ff15334a581878c3722c6adcd6c9d8d52fb62767fa36.xcframework.zip",
            checksum: "ee961f78853eeb051937ff15334a581878c3722c6adcd6c9d8d52fb62767fa36"
        ),
        .target(
            name: "_CryptoExtras_Aggregation",
            dependencies: ["_CryptoExtras"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "_CryptoExtras",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/_CryptoExtras-628fc80139c210ad19dfc13c6e7be322697b0e79e1c25109eedf36b7fedfafaa.xcframework.zip",
            checksum: "628fc80139c210ad19dfc13c6e7be322697b0e79e1c25109eedf36b7fedfafaa"
        ),
        .target(
            name: "CryptoBoringWrapper_Aggregation",
            dependencies: ["CryptoBoringWrapper"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CryptoBoringWrapper",
            url: "https://github.com/swift-precompiled/swift-crypto/releases/download/3.15.1/CryptoBoringWrapper-35aa57a29d7e4cad7dd204f443c3306ec0871374c16f6219fd4ff8b0182b4f9b.xcframework.zip",
            checksum: "35aa57a29d7e4cad7dd204f443c3306ec0871374c16f6219fd4ff8b0182b4f9b"
        ),
        .target(
            name: "Crypto_PrecompiledProduct",
            dependencies: ["Crypto_Aggregation"]
        ),
        .target(
            name: "_CryptoExtras_PrecompiledProduct",
            dependencies: [
                "_CryptoExtras_Aggregation",
                "CCryptoBoringSSL",
                "CCryptoBoringSSLShims",
                "CryptoBoringWrapper_Aggregation",
                "Crypto_Aggregation",
                .product(
                    name: "SwiftASN1",
                    package: "swift-asn1"
                )
            ]
        )
    ],
    cxxLanguageStandard: .cxx17
)