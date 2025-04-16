//
//  Screen1SubView2Router.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol Screen1SubView2Router: AnyObject {}

@MainActor final class Screen1SubView2ViewContainer: ObservableObject {}

final class Screen1SubView2RouterImpl: Screen1SubView2Router {
  private let viewContainer: Screen1SubView2ViewContainer
  
  init(viewContainer: Screen1SubView2ViewContainer) {
    self.viewContainer = viewContainer
  }
}
