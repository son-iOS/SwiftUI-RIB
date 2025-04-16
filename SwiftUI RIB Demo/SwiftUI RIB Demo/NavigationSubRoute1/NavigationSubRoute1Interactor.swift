//
//  NavigationSubRoute1Interactor.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation
import Combine

@MainActor protocol NavigationSubRoute1Interactor: AnyObject {
  func subRoute1DidClose()
}

@MainActor protocol NavigationSubRoute1PublisherContainer {
  var completionPublisher: AnyPublisher<Void, Never> { get }
}

@MainActor final class NavigationSubRoute1StateContainer: ObservableObject {}

final class NavigationSubRoute1InteractorImpl: NavigationSubRoute1Interactor,
                                               NavigationSubRoute1PublisherContainer {
  var completionPublisher: AnyPublisher<Void, Never> { completionSubject.eraseToAnyPublisher() }

  private let completionSubject = PassthroughSubject<Void, Never>()

  private let router: NavigationSubRoute1Router
  private let stateContainer: NavigationSubRoute1StateContainer

  init(router: NavigationSubRoute1Router,
       stateContainer: NavigationSubRoute1StateContainer) {
    self.router = router
    self.stateContainer = stateContainer
  }

  func subRoute1DidClose() {
    completionSubject.send()
  }
}
