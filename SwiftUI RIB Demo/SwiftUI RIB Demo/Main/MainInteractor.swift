//
//  MainInteractor.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation
import Combine

@MainActor protocol MainInteractor: AnyObject {}

@MainActor protocol MainPublisherContainer {}

@MainActor final class MainStateContainer: ObservableObject {}

final class MainInteractorImpl: MainInteractor, MainPublisherContainer {
  private var screen1Cancellable: AnyCancellable?
  private var screen2Cancellable: AnyCancellable?

  private let router: MainRouter
  private let stateContainer: MainStateContainer

  init(router: MainRouter,
       stateContainer: MainStateContainer) {
    self.router = router
    self.stateContainer = stateContainer
    attachScreen1()
  }

  private func attachScreen1() {
    let output = router.attachScreen1()
    screen1Cancellable = output.publishers.actionPublisher
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] action in
        switch action {
        case .goToNextScreen:
          self?.attacheScreen2()
        }
      })
  }

  private func attacheScreen2() {
    let output = router.attachScreen2()
    screen2Cancellable = output.publishers.completionPublisher
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] in
        self?.screen2Cancellable = nil
        self?.router.detachScreen2()
      })
  }
}
