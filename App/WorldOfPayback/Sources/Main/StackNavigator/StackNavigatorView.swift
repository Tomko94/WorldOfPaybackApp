//
//  StackNavigatorView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

struct StackNavigatorView<Content: View>: View {
    @ObservedObject var navigator = StackNavigator()
    var content: (_ rootNavigator: RootNavigatorLayer) -> Content

    var body: some View {
        NavigationStack(path: $navigator.path) {
            content(navigator)
                .navigationDestination(for: NavigationDestination.self) { destination in
                    navigator.viewForDestination(destination)
                }
        }
    }
}
