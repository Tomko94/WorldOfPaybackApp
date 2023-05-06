//
//  StackNavigator.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

internal enum NavigationDestination: Hashable {
    case dummy(module: DummyModule)
    case transactionList(module: TransactionListModule)
    case transactionDetails(module: TransactionDetailsModule)
}

class StackNavigator: RootNavigatorLayer {
    @ViewBuilder func viewForDestination(_ destination: NavigationDestination) -> some View {
        switch destination {
        case let .dummy(module):
            module.assemble()
        case let .transactionList(module):
            module.assemble()
        case let .transactionDetails(module):
            module.assemble()
        }
    }
}
