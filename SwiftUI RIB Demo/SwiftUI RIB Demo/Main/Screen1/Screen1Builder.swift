//
//  Screen1Builder.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@MainActor final class Screen1Builder {
  private let dependency: Screen1Dependency

  init(withDependency dependency: Screen1Dependency) {
    self.dependency = dependency
  }

  func build() -> Screen1Output {
    let viewContainer = Screen1ViewContainer()
    let router = Screen1RouterImpl(
      viewContainer: viewContainer
    )
    
    let stateContainer = Screen1StateContainer()
    let interactor = Screen1InteractorImpl(
      router: router,
      stateContainer: stateContainer,
      someManager: dependency.someManager
    )

    let view = Screen1View(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return Screen1Output(view: view, publishers: interactor)
  }
}
