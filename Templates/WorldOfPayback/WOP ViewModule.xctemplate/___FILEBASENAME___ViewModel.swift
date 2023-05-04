//  ___FILEHEADER___

import Foundation
import SwiftUIArch

internal protocol ___VARIABLE_productName___ViewModelType: ViewModelLayerType, ObservableObject {
    // Define ___VARIABLE_productName___ViewModelType here.
}

internal final class ___VARIABLE_productName___ViewModel: ViewModelLayer<___VARIABLE_productName___Navigator>, ___VARIABLE_productName___ViewModelType {
    // MARK: - Private Properties

    private let serviceProvider: ServiceProviderType
    private let mapper = ___VARIABLE_productName___Mapper()
    
    // MARK: - Initialization

    init(
        navigator: ___VARIABLE_productName___Navigator,
        serviceProvider: ServiceProviderType = ServiceProvider()
    ) {
        self.serviceProvider = serviceProvider
        super.init(navigator: navigator)
    }
}
