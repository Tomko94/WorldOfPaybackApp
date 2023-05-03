//  
//  TransactionDetailsViewModel.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUIArch

internal protocol TransactionDetailsViewModelType: ViewModelLayerType, ObservableObject {
    // Define TransactionDetailsViewModelType here.
}

internal final class TransactionDetailsViewModel: ViewModelLayer<TransactionDetailsNavigator>, TransactionDetailsViewModelType {
    private let serviceProvider: ServiceProviderType
    
    init(navigator: TransactionDetailsNavigator, _ serviceProvider: ServiceProviderType = ServiceProvider()) {
        self.serviceProvider = serviceProvider
        super.init(navigator: navigator)
    }

    override func initialize() {
    }
}
