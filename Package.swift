// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GoogleAnalyticsProvider",
  products: [
    .library(name: "GoogleAnalyticsProvider", targets: ["GoogleAnalyticsProvider"]),
    ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0")
  ],
  targets: [
    .target(name: "GoogleAnalyticsProvider", dependencies: ["Vapor"]),
    .testTarget(name: "GoogleAnalyticsProviderTests", dependencies: ["GoogleAnalyticsProvider"]),
    ]
)
