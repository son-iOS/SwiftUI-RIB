//
//  Screen1SubView1Builder.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@MainActor final class Screen1SubView1Builder {
  private let dependency: Screen1SubView1Dependency

  init(withDependency dependency: Screen1SubView1Dependency) {
    self.dependency = dependency
  }

  func build() -> Screen1SubView1Output {
    let viewContainer = Screen1SubView1ViewContainer()
    let router = Screen1SubView1RouterImpl(
      viewContainer: viewContainer
    )
    
    let stateContainer = Screen1SubView1StateContainer()
    let interactor = Screen1SubView1InteractorImpl(
      router: router,
      stateContainer: stateContainer
    )

    let view = Screen1SubView1View(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return Screen1SubView1Output(view: view, publishers: interactor)
  }
}
