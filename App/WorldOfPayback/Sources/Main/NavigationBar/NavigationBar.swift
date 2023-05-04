//
//  NavigationBar.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

struct NavigationBar: ViewModifier {
    // MARK: - private Properties

     var title: String

    // MARK: - Body Definition

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.gray,
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

// -----------------------------------------------------------------------------
// MARK: - View Extension
// -----------------------------------------------------------------------------

extension View {
    func navigationBar(with title: String) -> some View {
        modifier(NavigationBar(title: title))
    }
}
