//
//  ViewModelLayer.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

open class ViewModelLayer<NavigatorLayer: NavigatorLayerType>: ViewModelLayerType {
    // MARK: - Open Properties

    open var navigator: NavigatorLayer

    // MARK: - Initialization

    public init(navigator: NavigatorLayer) {
        self.navigator = navigator
    }
}
