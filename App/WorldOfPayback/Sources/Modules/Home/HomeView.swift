//
//  HomeView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

internal struct HomeView<ViewModel: HomeViewModelType>: View, ViewLayerType {
    // MARK: - Internal Properties

    @StateObject internal var viewModel: ViewModel

    // MARK: - Body Definition

    internal var body: some View {
        TabView {
            StackNavigatorView { rootNavigator in
                TransactionListModule().assemble(rootNavigator: rootNavigator)
            }
            .tabItem {
                Label("Transactions", systemImage: "dollarsign")
            }

            StackNavigatorView { _ in
                Text("Coming soon")
                    .navigationBar(with: "Shop")
            }
            .tabItem {
                Label("Shop", systemImage: "cart")
            }

            StackNavigatorView { _ in
                Text("Coming soon")
                    .navigationBar(with: "Feed")
            }
            .tabItem {
                Label("Feed", systemImage: "newspaper")
            }

            StackNavigatorView { _ in
                Text("Coming soon")
                    .navigationBar(with: "Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Preview
// -----------------------------------------------------------------------------

internal struct HomeView_Previews: PreviewProvider {
    internal static var previews: some View {
        HomeView(viewModel: HomeViewModel(navigator: HomeNavigator(rootNavigator: nil)))
    }
}
