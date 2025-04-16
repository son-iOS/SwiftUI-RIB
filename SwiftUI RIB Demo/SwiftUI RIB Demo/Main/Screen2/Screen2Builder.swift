//
//  Screen2Builder.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@MainActor final class Screen2Builder {
  private let dependency: Screen2Dependency

  init(withDependency dependency: Screen2Dependency) {
    self.dependency = dependency
  }

  func build() -> Screen2Output {
    let viewContainer = Screen2ViewContainer()
    let router = Screen2RouterImpl(
      viewContainer: viewContainer
    )
    
    let stateContainer = Screen2StateContainer()
    let interactor = Screen2InteractorImpl(
      router: router,
      stateContainer: stateContainer
    )

    let view = Screen2View(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return Screen2Output(view: view, publishers: interactor)
  }
}
