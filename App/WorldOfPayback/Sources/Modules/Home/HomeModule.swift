//
//  HomeModule.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUIArch

internal final class HomeModule: ModuleLayer {
    typealias ViewLayer = HomeView<HomeViewModel>

    let viewModel: ViewLayer.ViewModelLayer

    public init(rootNavigator: RootNavigatorLayerType?) {
        let navigator = ViewLayer.ViewModelLayer.NavigatorLayer(rootNavigator: nil)
        viewModel = ViewLayer.ViewModelLayer(navigator: navigator)
        super.init()
    }

    func assemble() -> ViewLayer {
        ViewLayer(viewModel: self.viewModel)
    }
}
