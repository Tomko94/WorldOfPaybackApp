//
//  StackNavigator.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

public enum NavigationDestination: Hashable {
    case dummy
    case transactionDetails(transactionEntity: TransactionEntity)
}

class StackNavigator: RootNavigatorLayer {
    @ViewBuilder func viewForDestination(_ destination: NavigationDestination) -> some View {
        switch destination {
        case .dummy:
            Text("Dummy screen")
        case let .transactionDetails(transactionEntity):
            TransactionDetailsModule().assemble(rootNavigator: self)
        }
    }
}
