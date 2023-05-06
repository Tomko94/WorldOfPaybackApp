//  
//  DummyView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 06/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

internal struct DummyView<ViewModel: DummyViewModelType>: View, ViewLayerType {
    // MARK: - Internal Properties

    @StateObject internal var viewModel: ViewModel

    // MARK: - Body Definition

    internal var body: some View {
        Text("Dummy")
            .navigationBar(with: "Dummy Title")
    }
}

// -----------------------------------------------------------------------------
// MARK: - Preview
// -----------------------------------------------------------------------------

internal struct DummyView_Previews: PreviewProvider {
    internal static var previews: some View {
        DummyView(viewModel: DummyViewModel(navigator: DummyNavigator(rootNavigator: nil)))
    }
}
