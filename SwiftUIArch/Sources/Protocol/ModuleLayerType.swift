//
//  ModuleLayerType.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import SwiftUI

public protocol ModuleLayerType: AnyObject {
    associatedtype ViewLayer: ViewLayerType

    func assemble(rootNavigator: RootNavigatorLayerType?) -> ViewLayer
}
