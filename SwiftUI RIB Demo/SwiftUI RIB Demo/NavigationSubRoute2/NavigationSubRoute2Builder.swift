//
//  NavigationSubRoute2Builder.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@MainActor final class NavigationSubRoute2Builder {
  private let dependency: NavigationSubRoute2Dependency

  init(withDependency dependency: NavigationSubRoute2Dependency) {
    self.dependency = dependency
  }

  func build() -> NavigationSubRoute2Output {
    let viewContainer = NavigationSubRoute2ViewContainer()
    let router = NavigationSubRoute2RouterImpl(
      viewContainer: viewContainer
    )
    
    let stateContainer = NavigationSubRoute2StateContainer()
    let interactor = NavigationSubRoute2InteractorImpl(
      router: router,
      stateContainer: stateContainer
    )

    let view = NavigationSubRoute2View(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return NavigationSubRoute2Output(view: view, publishers: interactor)
  }
}
