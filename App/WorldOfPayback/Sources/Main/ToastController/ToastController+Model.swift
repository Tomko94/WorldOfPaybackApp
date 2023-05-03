//
//  ToastController+Model.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

extension ToastController {
    public final class Model: ObservableObject {
        // MARK: - Published Properties

        @Published var toastType: State = .normal
        
    }
}
