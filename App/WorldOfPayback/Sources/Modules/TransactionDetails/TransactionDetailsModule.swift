//
//  TransactionDetailsModule.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUIArch

internal final class TransactionDetailsModule: ModuleLayer<TransactionDetailsView<TransactionDetailsViewModel>> {
    // MARK: - Private Properties
    
    private let transactionEntity: TransactionEntity

    // MARK: - Initialization

    init(_ transactionEntity: TransactionEntity) {
        self.transactionEntity = transactionEntity
    }

    // MARK: - Assemble

    internal override func assemble(rootNavigator: RootNavigatorLayerType?) -> ViewLayer {
        let navigator = ViewLayer.ViewModelLayer.NavigatorLayer(rootNavigator: rootNavigator)
        let viewModel = ViewLayer.ViewModelLayer(navigator: navigator, transactionEntity: transactionEntity)
        let view = ViewLayer(viewModel: viewModel)

        return view
    }
}
