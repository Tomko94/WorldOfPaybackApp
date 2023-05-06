//
//  ModuleLayer.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import SwiftUI

open class ModuleLayer {
    // MARK: - Private Properties

    private let id = UUID()

    // MARK: - Initialization

    public init() {}
}

extension ModuleLayer: Hashable {
    public static func == (lhs: ModuleLayer, rhs: ModuleLayer) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
