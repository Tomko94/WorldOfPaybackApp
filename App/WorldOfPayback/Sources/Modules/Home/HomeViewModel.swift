//
//  HomeViewModel.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUIArch

internal protocol HomeViewModelType: ViewModelLayerType, ObservableObject {}

internal final class HomeViewModel: ViewModelLayer<HomeNavigator>, HomeViewModelType {
    // MARK: - Private Properties

    private let serviceProvider: ServiceProviderType
    private let mapper = HomeMapper()

    // MARK: - Initialization

    init(
        navigator: HomeNavigator,
        serviceProvider: ServiceProviderType = ServiceProvider()
    ) {
        self.serviceProvider = serviceProvider
        super.init(navigator: navigator)
    }
}
