//
//  Translations.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

class Translations {
    static func localizedString(_ stringKey: String) -> String {
        Bundle.main.localizedString(forKey: stringKey, value: nil, table: nil)
    }
}
