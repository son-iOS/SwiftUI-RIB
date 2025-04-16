//
//  Screen2Interactor.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation
import Combine

@MainActor protocol Screen2Interactor: AnyObject {
  func screen2DidClose()
  func screen2DidSelectSubRoute1()
  func screen2DidSelectSubRoute2()
}

@MainActor protocol Screen2PublisherContainer {
  var completionPublisher: AnyPublisher<Void, Never> { get }
}

@MainActor final class Screen2StateContainer: ObservableObject {}

final class Screen2InteractorImpl: Screen2Interactor, Screen2PublisherContainer {
  var completionPublisher: AnyPublisher<Void, Never> { completionSubject.eraseToAnyPublisher() }

  private let completionSubject = PassthroughSubject<Void, Never>()
  private var subRoute1Cancellable: AnyCancellable?
  private var subRoute2Cancellable: AnyCancellable?

  private let router: Screen2Router
  private let stateContainer: Screen2StateContainer

  init(router: Screen2Router,
       stateContainer: Screen2StateContainer) {
    self.router = router
    self.stateContainer = stateContainer
  }

  func screen2DidClose() {
    completionSubject.send()
  }

  func screen2DidSelectSubRoute1() {
    let output = router.attachSubRoute1()
    subRoute1Cancellable = output.publishers.completionPublisher
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] in
        self?.subRoute1Cancellable = nil
        self?.router.detachSubRoute1()
      })
  }

  func screen2DidSelectSubRoute2() {
    let output = router.attachSubRoute2()
    subRoute2Cancellable = output.publishers.completionPublisher
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] in
        self?.subRoute2Cancellable = nil
        self?.router.detachSubRoute2()
      })
  }
}
