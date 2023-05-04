//
//  ToastController+Model.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

extension ToastController {
    public final class Model: ObservableObject {
        // MARK: - Internal Published Properties

        @Published internal var isCoverShown = false
        @Published internal var isProgressIndicatorShown = false
        @Published internal var message: String? = nil

        // MARK: - Internal Properties

        internal var state: State = .hidden {
            didSet {
                update(state: state)
            }
        }

        internal var retryButtonTitle: String? {
            (retry == nil) ? nil : Translations.localizedString("Try Again")
        }

        internal var closeButtonTitle: String? {
            dismissible ? Translations.localizedString("Close") : nil
        }

        // MARK: - Private Properties

        private var dismissible = false
        private var retry: Retry?

        // MARK: - Initialization

        private func update(state: State) {
            switch state {
            case .loading:
                dismissible = false
                isProgressIndicatorShown = true
                isCoverShown = true
                message = nil
                retry = nil
            case .hidden:
                dismissible = false
                isProgressIndicatorShown = false
                isCoverShown = false
                message = nil
                retry = nil
            case let .error(message, dismissible, retry):
                self.dismissible = dismissible
                isProgressIndicatorShown = false
                isCoverShown = true
                self.message = message
                self.retry = retry
            }
        }

        // MARK: - Action

        internal func closeTapped() {
            if dismissible {
                state = .hidden
            }
        }

        internal func retryTapped() {
            retry?()
        }
    }
}
