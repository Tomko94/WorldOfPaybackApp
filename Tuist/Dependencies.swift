//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Tomasz Węsierski on 01/05/2023.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .local(path: "SwiftUIArch"),
        .remote(url: "https://github.com/pointfreeco/swift-snapshot-testing", requirement: .upToNextMajor(from: "1.10.0"))
    ],
    platforms: [.iOS]
)
