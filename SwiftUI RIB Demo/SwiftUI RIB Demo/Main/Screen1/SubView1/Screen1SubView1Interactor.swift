//
//  Screen1SubView1Interactor.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol Screen1SubView1Interactor: AnyObject {}

@MainActor protocol Screen1SubView1PublisherContainer {}

@MainActor final class Screen1SubView1StateContainer: ObservableObject {}

final class Screen1SubView1InteractorImpl: Screen1SubView1Interactor, Screen1SubView1PublisherContainer {
  private let router: Screen1SubView1Router
  private let stateContainer: Screen1SubView1StateContainer

  init(router: Screen1SubView1Router,
       stateContainer: Screen1SubView1StateContainer) {
    self.router = router
    self.stateContainer = stateContainer
  }
}
