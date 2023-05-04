//
//  HomeModule.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUIArch

internal final class HomeModule: ModuleLayer<HomeView<HomeViewModel>> {
    // MARK: - Assemble

    internal override func assemble(rootNavigator: RootNavigatorLayerType?) -> ViewLayer {
        let navigator = ViewLayer.ViewModelLayer.NavigatorLayer(rootNavigator: rootNavigator)
        let viewModel = ViewLayer.ViewModelLayer(navigator: navigator)
        let view = ViewLayer(viewModel: viewModel)

        return view
    }
}
