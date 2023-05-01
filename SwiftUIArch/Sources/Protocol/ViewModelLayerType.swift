//
//  ViewModelLayerType.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import Foundation

public protocol ViewModelLayerType: AnyObject {
    associatedtype NavigatorLayer: NavigatorLayerType

    var navigator: NavigatorLayer { get }
}
