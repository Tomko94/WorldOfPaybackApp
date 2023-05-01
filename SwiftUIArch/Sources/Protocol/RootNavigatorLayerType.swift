//
//  RootNavigatorLayerType.swift
//  SwiftUIArch
//
//  Created by Tomasz Węsierski on 29/04/2023.
//  Copyright © 2023 tw. All rights reserved.
//

import SwiftUI

public protocol RootNavigatorLayerType: AnyObject {
    var path: NavigationPath { get set }
}
