//
//  StackNavigatorView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

struct StackNavigatorView: View {
    @ObservedObject var navigator = StackNavigator()

    var rootDestination: NavigationDestination = .dummy(module: DummyModule(rootNavigator: nil))
    
    init(rootDestination: (_ rootNavigator: RootNavigatorLayer) -> NavigationDestination) {
        self.rootDestination = rootDestination(navigator)
    }

    // MARK: - Body Definition

    var body: some View {
        NavigationStack(path: $navigator.path) {
            navigator.viewForDestination(rootDestination)
                .navigationDestination(for: NavigationDestination.self) { destination in
                    navigator.viewForDestination(destination)
                }
        }
    }
}
