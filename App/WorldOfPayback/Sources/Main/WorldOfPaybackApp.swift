//
//  StackNavigator.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

@main
struct WorldOfPaybackApp: App {
    var body: some Scene {
        WindowGroup {
            StackNavigatorView { rootNavigator in
                TransactionListModule().assemble(rootNavigator: rootNavigator)
            }
        }
    }
}
