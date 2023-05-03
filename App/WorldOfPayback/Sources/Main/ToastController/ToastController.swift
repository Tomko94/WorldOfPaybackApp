//
//  ToastController.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

struct ToastController: ViewModifier {
    // MARK: - private Properties

    @ObservedObject private var model: Model

    // MARK: - Initialization

    internal init(_ model: Model) {
        self.model = model
    }

    // MARK: - Body Definition

    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(1.0)

            switch model.toastType {
            case .normal:
                Text("").hidden()
            case .loading:
                cover()
                    .zIndex(2.0)
            case let .error(message):
                Text(message)
                    .zIndex(2.0)
            }
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

extension ToastController {
    private func cover() -> some View {
        ZStack {
            Color(red: 0.5, green: 0.5, blue: 0.5)
                .opacity(0.7)
                .contentShape(Rectangle())
                .ignoresSafeArea()
                .zIndex(1.0)
            ProgressView()
                .scaleEffect(2.0)
                .zIndex(2.0)
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - View Extension
// -----------------------------------------------------------------------------

extension View {
    func toastController(with model: ToastController.Model) -> some View {
        modifier(ToastController(model))
    }
}
