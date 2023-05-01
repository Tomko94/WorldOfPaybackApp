//
//  ViewLayerType.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import Foundation

public protocol ViewLayerType {
    associatedtype ViewModelLayer: ViewModelLayerType

    var viewModel: ViewModelLayer { get }
}
