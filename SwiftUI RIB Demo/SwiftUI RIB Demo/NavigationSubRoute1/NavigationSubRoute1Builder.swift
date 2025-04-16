//
//  NavigationSubRoute1Builder.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@MainActor final class NavigationSubRoute1Builder {
  private let dependency: NavigationSubRoute1Dependency

  init(withDependency dependency: NavigationSubRoute1Dependency) {
    self.dependency = dependency
  }

  func build() -> NavigationSubRoute1Output {
    let viewContainer = NavigationSubRoute1ViewContainer()
    let router = NavigationSubRoute1RouterImpl(
      viewContainer: viewContainer
    )
    
    let stateContainer = NavigationSubRoute1StateContainer()
    let interactor = NavigationSubRoute1InteractorImpl(
      router: router,
      stateContainer: stateContainer
    )

    let view = NavigationSubRoute1View(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return NavigationSubRoute1Output(view: view, publishers: interactor)
  }
}
