//
//  NavigatorLayer.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import SwiftUI

open class NavigatorLayer: NavigatorLayerType {
    // MARK: - Open Properties

    open weak var rootNavigator: RootNavigatorLayerType?

    // MARK: - Initialization

    public init(rootNavigator: RootNavigatorLayerType?) {
        self.rootNavigator = rootNavigator
    }
}
