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
    
    // MARK: - Private Properties

    private var initialized = false

    // MARK: - Initialization

    public init(navigator: NavigatorLayer) {
        self.navigator = navigator
    }

    open func initialize() {}

    // MARK: - Lifecycle

    open func onAppear() {
        if !initialized {
            initialize()
            initialized = true
        }
    }
}
