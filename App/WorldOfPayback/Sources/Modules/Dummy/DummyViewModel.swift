//  
//  DummyViewModel.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 06/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUIArch

internal protocol DummyViewModelType: ViewModelLayerType, ObservableObject {
    // Define DummyViewModelType here.
}

internal final class DummyViewModel: ViewModelLayer<DummyNavigator>, DummyViewModelType {
    // MARK: - Private Properties

    private let serviceProvider: ServiceProviderType
    private let mapper = DummyMapper()
    
    // MARK: - Initialization

    init(
        navigator: DummyNavigator,
        serviceProvider: ServiceProviderType = ServiceProvider()
    ) {
        self.serviceProvider = serviceProvider
        super.init(navigator: navigator)
    }
}
