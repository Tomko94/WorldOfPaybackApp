//
//  TransactionListModule.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIArch

internal final class TransactionListModule: ModuleLayer {
    
    typealias ViewLayer = TransactionListView<TransactionListViewModel>

    let viewModel: TransactionListViewModel

    public init(rootNavigator: RootNavigatorLayerType?) {
        let navigator = TransactionListNavigator(rootNavigator: rootNavigator)
        viewModel = TransactionListViewModel(navigator: navigator)
        super.init()
    }

    func assemble() -> ViewLayer {
        ViewLayer(viewModel: viewModel)
    }
}
