//
//  Screen1SubView2Interactor.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol Screen1SubView2Interactor: AnyObject {}

@MainActor protocol Screen1SubView2PublisherContainer {}

@MainActor final class Screen1SubView2StateContainer: ObservableObject {}

final class Screen1SubView2InteractorImpl: Screen1SubView2Interactor, Screen1SubView2PublisherContainer {
  private let router: Screen1SubView2Router
  private let stateContainer: Screen1SubView2StateContainer

  init(router: Screen1SubView2Router,
       stateContainer: Screen1SubView2StateContainer) {
    self.router = router
    self.stateContainer = stateContainer
  }
}
