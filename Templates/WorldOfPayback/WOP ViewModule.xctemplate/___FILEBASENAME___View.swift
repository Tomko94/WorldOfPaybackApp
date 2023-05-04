//  ___FILEHEADER___

import SwiftUI
import SwiftUIArch

internal struct ___VARIABLE_productName___View<ViewModel: ___VARIABLE_productName___ViewModelType>: View, ViewLayerType {
    // MARK: - Internal Properties

    @StateObject internal var viewModel: ViewModel

    // MARK: - Body Definition

    internal var body: some View {
        Text("Hello, world!")
    }
}

// -----------------------------------------------------------------------------
// MARK: - Preview
// -----------------------------------------------------------------------------

internal struct ___VARIABLE_productName___View_Previews: PreviewProvider {
    internal static var previews: some View {
        ___VARIABLE_productName___View(viewModel: ___VARIABLE_productName___ViewModel(navigator: ___VARIABLE_productName___Navigator(rootNavigator: nil)))
    }
}
