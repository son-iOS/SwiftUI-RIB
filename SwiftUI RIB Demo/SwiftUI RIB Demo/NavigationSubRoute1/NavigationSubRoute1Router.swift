//
//  NavigationSubRoute1Router.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol NavigationSubRoute1Router: AnyObject {}

@MainActor final class NavigationSubRoute1ViewContainer: ObservableObject {}

final class NavigationSubRoute1RouterImpl: NavigationSubRoute1Router {
  private let viewContainer: NavigationSubRoute1ViewContainer
  
  init(viewContainer: NavigationSubRoute1ViewContainer) {
    self.viewContainer = viewContainer
  }
}
