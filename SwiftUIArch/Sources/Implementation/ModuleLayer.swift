//
//  ModuleLayer.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import SwiftUI

open class ModuleLayer<ViewLayer: ViewLayerType>: ModuleLayerType {
    // MARK: - Public Typealiases

    public typealias ViewLayer = ViewLayer

    // MARK: - Initialization

    public init() {}

    // MARK: - Abstract Assemble Method

    open func assemble(rootNavigator: RootNavigatorLayerType?) -> ViewLayer { fatalError("Not implemented method \(#function)") }
}
