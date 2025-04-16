//
//  NavigationSubRoute2Interactor.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation
import Combine

@MainActor protocol NavigationSubRoute2Interactor: AnyObject {
  func subRoute2DidClose()
}

@MainActor protocol NavigationSubRoute2PublisherContainer {
  var completionPublisher: AnyPublisher<Void, Never> { get }
}

@MainActor final class NavigationSubRoute2StateContainer: ObservableObject {}

final class NavigationSubRoute2InteractorImpl: NavigationSubRoute2Interactor,
                                               NavigationSubRoute2PublisherContainer {
  var completionPublisher: AnyPublisher<Void, Never> { completionSubject.eraseToAnyPublisher() }

  private let completionSubject = PassthroughSubject<Void, Never>()
  
  private let router: NavigationSubRoute2Router
  private let stateContainer: NavigationSubRoute2StateContainer

  init(router: NavigationSubRoute2Router,
       stateContainer: NavigationSubRoute2StateContainer) {
    self.router = router
    self.stateContainer = stateContainer
  }

  func subRoute2DidClose() {
    completionSubject.send()
  }
}
