//
//  NavigatorLayer.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 05/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import SwiftUI

public protocol NavigatorLayerType: AnyObject {
    var rootNavigator: RootNavigatorLayerType? { get }
}
