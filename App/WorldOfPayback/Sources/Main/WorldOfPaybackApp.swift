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
    let rootModule = HomeModule(rootNavigator: nil)
    var body: some Scene {
        WindowGroup {
            rootModule.assemble()
        }
    }
}
