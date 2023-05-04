//  ___FILEHEADER___

import Foundation
import SwiftUIArch

internal final class ___VARIABLE_productName___Module: ModuleLayer<___VARIABLE_productName___View<___VARIABLE_productName___ViewModel>> {
    
    // MARK: - Assemble

    internal override func assemble(rootNavigator: RootNavigatorLayerType?) -> ViewLayer {
        let navigator = ViewLayer.ViewModelLayer.NavigatorLayer(rootNavigator: rootNavigator)
        let viewModel = ViewLayer.ViewModelLayer(navigator: navigator)
        let view = ViewLayer(viewModel: viewModel)
        
        return view
    }
}
