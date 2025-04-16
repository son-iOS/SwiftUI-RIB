//
//  MainRouter.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

enum MainRoute {
  case screen1, screen2
}

@MainActor protocol MainRouter: AnyObject {
  func attachScreen1() -> Screen1Output
  func attachScreen2() -> Screen2Output
  func detachScreen2()
}

@MainActor final class MainViewContainer: ObservableObject {
  @Published fileprivate(set) var screens: [MainRoute] = []
  @Published fileprivate(set) var screen1: Screen1View?
  @Published fileprivate(set) var screen2: Screen2View?
}

final class MainRouterImpl: MainRouter {
  private let viewContainer: MainViewContainer

  private let someManager: SomeManager

  init(viewContainer: MainViewContainer,
       someManager: SomeManager) {
    self.viewContainer = viewContainer
    self.someManager = someManager
  }

  func attachScreen1() -> Screen1Output {
    let dependency = Screen1Dependency(someManager: someManager)
    let builder = Screen1Builder(withDependency: dependency)
    let output = builder.build()
    viewContainer.screen1 = output.view
    viewContainer.screens = [.screen1]
    return output
  }

  func attachScreen2() -> Screen2Output {
    let dependency = Screen2Dependency(someManager: someManager)
    let builder = Screen2Builder(withDependency: dependency)
    let output = builder.build()
    viewContainer.screen2 = output.view
    viewContainer.screens.append(.screen2)
    return output
  }

  func detachScreen2() {
    viewContainer.screens.removeAll(where: { $0 == .screen2 })
    viewContainer.screen2 = nil
  }
}
