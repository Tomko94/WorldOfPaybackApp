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
    var title: String { get }
    var partnerName: String { get }
    var description: String? { get }
}

internal final class TransactionDetailsViewModel: ViewModelLayer<TransactionDetailsNavigator>, TransactionDetailsViewModelType {
    // MARK: - Internal Published Properties

    @Published internal var title = Translations.localizedString("TransactionDetailsTitle")
    @Published internal var partnerName = ""
    @Published internal var description: String? = ""

    // MARK: - Private Properties

    private let serviceProvider: ServiceProviderType
    private let transactionEntity: TransactionEntity
    private let mapper = TransactionDetailsMapper()

    // MARK: - Initialization

    init(
        navigator: TransactionDetailsNavigator,
        serviceProvider: ServiceProviderType = ServiceProvider(),
        transactionEntity: TransactionEntity
    ) {
        self.serviceProvider = serviceProvider
        self.transactionEntity = transactionEntity
        super.init(navigator: navigator)
    }

    override func initialize() {
        prepareModel(transactionEntity)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Prepare Model
// -----------------------------------------------------------------------------

extension TransactionDetailsViewModel {
    private func prepareModel(_ transactionEntity: TransactionEntity) {
        self.partnerName = mapper.mapPartnerName(transactionEntity)
        self.description = mapper.mapDescription(transactionEntity)
    }
}
