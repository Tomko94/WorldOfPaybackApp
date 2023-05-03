//
//  ToastController+Type.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

extension ToastController {
    public enum State {
        case error(message: String)
        case loading
        case normal
    }
}
