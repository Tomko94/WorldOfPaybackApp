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

            Group {
                if model.isCoverShown {
                    cover()
                }

                model.message.map {
                    error($0)
                }
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

            if model.isProgressIndicatorShown {
                ProgressView()
                    .scaleEffect(2.0)
            }
        }
    }

    private func error(_ message: String) -> some View {
        VStack(alignment: .center, spacing: Layout.Spacing.medium) {
            Text(message)

            HStack(spacing: Layout.Spacing.medium) {
                model.retryButtonTitle.map {
                    Button($0) {
                        model.retryTapped()
                    }
                }

                model.closeButtonTitle.map {
                    Button($0) {
                        model.closeTapped()
                    }
                }
            }
        }
        .padding(Layout.Spacing.medium)
        .background(Color.white)
        .cornerRadius(Layout.CornerRadius.standard)
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
