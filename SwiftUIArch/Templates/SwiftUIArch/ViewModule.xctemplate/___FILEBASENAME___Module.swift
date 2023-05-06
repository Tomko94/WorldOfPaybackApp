//  ___FILEHEADER___

import Foundation
import SwiftUIArch

internal final class ___VARIABLE_productName___Module: ModuleLayer {
    typealias ViewLayer = ___VARIABLE_productName___View<___VARIABLE_productName___ViewModel>

    let viewModel: ViewLayer.ViewModelLayer

    public init(rootNavigator: RootNavigatorLayerType?) {
        let navigator = ViewLayer.ViewModelLayer.NavigatorLayer(rootNavigator: rootNavigator)
        viewModel = ViewLayer.ViewModelLayer(navigator: navigator)
        super.init()
    }

    func assemble() -> ViewLayer {
        ViewLayer(viewModel: self.viewModel)
    }
}
