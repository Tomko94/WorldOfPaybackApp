//
//  ToastController+State.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

extension ToastController {
    typealias Retry = () -> Void

    public enum State {
        case error(message: String, dismissible: Bool, _ retry: Retry? = nil)
        case loading
        case hidden
    }
}
