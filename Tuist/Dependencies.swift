//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Tomasz Węsierski on 01/05/2023.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .local(path: "SwiftUIArch")
    ],
    platforms: [.iOS]
)
