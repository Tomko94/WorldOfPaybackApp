//
//  TransactionListNavigator.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUIArch

internal final class TransactionListNavigator: NavigatorLayer {
    func pushTransactionDetailsView(transactionEntity: TransactionEntity) {
        guard let rootNavigator = rootNavigator else { return }
        rootNavigator.path.append(
            NavigationDestination.transactionDetails(
                module: TransactionDetailsModule(
                    rootNavigator: rootNavigator,
                    transactionEntity: transactionEntity
                )
            )
        )
    }
}
