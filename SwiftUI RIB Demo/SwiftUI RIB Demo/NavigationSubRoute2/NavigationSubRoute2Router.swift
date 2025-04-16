//
//  NavigationSubRoute2Router.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol NavigationSubRoute2Router: AnyObject {}

@MainActor final class NavigationSubRoute2ViewContainer: ObservableObject {}

final class NavigationSubRoute2RouterImpl: NavigationSubRoute2Router {
  private let viewContainer: NavigationSubRoute2ViewContainer
  
  init(viewContainer: NavigationSubRoute2ViewContainer) {
    self.viewContainer = viewContainer
  }
}
