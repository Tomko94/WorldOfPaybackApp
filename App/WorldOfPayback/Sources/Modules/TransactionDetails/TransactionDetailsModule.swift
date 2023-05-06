//
//  TransactionDetailsModule.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIArch

internal final class TransactionDetailsModule: ModuleLayer {
    typealias ViewLayer = TransactionDetailsView<TransactionDetailsViewModel>

    let viewModel: ViewLayer.ViewModelLayer

    public init(rootNavigator: RootNavigatorLayerType?, transactionEntity: TransactionEntity) {
        let navigator = ViewLayer.ViewModelLayer.NavigatorLayer(rootNavigator: rootNavigator)
        viewModel = ViewLayer.ViewModelLayer(navigator: navigator, transactionEntity: transactionEntity)
        super.init()
    }

    func assemble() -> ViewLayer {
        ViewLayer(viewModel: self.viewModel)
    }
}
