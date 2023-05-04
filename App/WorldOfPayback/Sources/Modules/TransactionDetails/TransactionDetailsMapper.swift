//
//  TransactionDetailsMapper.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine

class TransactionDetailsMapper {
    func mapPartnerName(_ transactionEntity: TransactionEntity) -> String {
        transactionEntity.partnerDisplayName
    }

    func mapDescription(_ transactionEntity: TransactionEntity) -> String? {
        transactionEntity.transactionDetail.description
    }
}
