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
    // MARK: - Private Properties

    @StateObject private var navigator = StackNavigator()

    // MARK: - Public Properties

    var content: (_ rootNavigator: RootNavigatorLayer) -> Content

    // MARK: - Body Definition

    var body: some View {
        NavigationStack(path: $navigator.path) {
            content(navigator)
                .navigationDestination(for: NavigationDestination.self) { destination in
                    navigator.viewForDestination(destination)
                }
        }
    }
}
