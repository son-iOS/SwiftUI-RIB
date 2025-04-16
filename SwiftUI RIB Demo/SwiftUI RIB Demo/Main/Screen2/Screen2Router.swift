//
//  Screen2Router.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol Screen2Router: AnyObject {
  func attachSubRoute1() -> NavigationSubRoute1Output
  func detachSubRoute1()
  func attachSubRoute2() -> NavigationSubRoute2Output
  func detachSubRoute2()
}

@MainActor final class Screen2ViewContainer: ObservableObject {
  @Published fileprivate(set) var subRoute1: NavigationSubRoute1View?
  @Published fileprivate(set) var subRoute2: NavigationSubRoute2View?
}

final class Screen2RouterImpl: Screen2Router {
  private let viewContainer: Screen2ViewContainer
  
  init(viewContainer: Screen2ViewContainer) {
    self.viewContainer = viewContainer
  }

  func attachSubRoute1() -> NavigationSubRoute1Output {
    let dependency = NavigationSubRoute1Dependency()
    let builder = NavigationSubRoute1Builder(withDependency: dependency)
    let output = builder.build()
    viewContainer.subRoute1 = output.view
    return output
  }

  func detachSubRoute1() {
    viewContainer.subRoute1 = nil
  }

  func attachSubRoute2() -> NavigationSubRoute2Output {
    let dependency = NavigationSubRoute2Dependency()
    let builder = NavigationSubRoute2Builder(withDependency: dependency)
    let output = builder.build()
    viewContainer.subRoute2 = output.view
    return output
  }

  func detachSubRoute2() {
    viewContainer.subRoute2 = nil
  }
}
