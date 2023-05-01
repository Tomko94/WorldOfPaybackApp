//
//  RootNavigatorLayer.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 30/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import SwiftUI

open class RootNavigatorLayer: RootNavigatorLayerType, ObservableObject {
    // MARK: - Open Properties

    @Published open var path = NavigationPath()

    // MARK: - Initialization

    public init() {}
}
