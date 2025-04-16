//
//  Screen1SubView2Builder.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@MainActor final class Screen1SubView2Builder {
  private let dependency: Screen1SubView2Dependency

  init(withDependency dependency: Screen1SubView2Dependency) {
    self.dependency = dependency
  }

  func build() -> Screen1SubView2Output {
    let viewContainer = Screen1SubView2ViewContainer()
    let router = Screen1SubView2RouterImpl(
      viewContainer: viewContainer
    )
    
    let stateContainer = Screen1SubView2StateContainer()
    let interactor = Screen1SubView2InteractorImpl(
      router: router,
      stateContainer: stateContainer
    )

    let view = Screen1SubView2View(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return Screen1SubView2Output(view: view, publishers: interactor)
  }
}
