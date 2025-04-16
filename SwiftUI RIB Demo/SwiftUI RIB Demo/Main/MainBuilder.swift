//
//  MainBuilder.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@MainActor final class MainBuilder {
  private let dependency: MainDependency

  init(withDependency dependency: MainDependency) {
    self.dependency = dependency
  }

  func build() -> MainOutput {
    let someManager = SomeManagerImpl()

    let viewContainer = MainViewContainer()
    let router = MainRouterImpl(
      viewContainer: viewContainer,
      someManager: someManager
    )
    
    let stateContainer = MainStateContainer()
    let interactor = MainInteractorImpl(
      router: router,
      stateContainer: stateContainer
    )

    let view = MainView(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return MainOutput(view: view, publishers: interactor)
  }
}
