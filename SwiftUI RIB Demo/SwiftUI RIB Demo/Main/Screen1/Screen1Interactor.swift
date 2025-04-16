//
//  Screen1Interactor.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation
import Combine

enum Screen1Action {
  case goToNextScreen
}

@MainActor protocol Screen1Interactor: AnyObject {
  func screen1DidSelectToAddSubView1()
  func screen1DidSelectToRemoveSubView1()
  func screen1DidSelectToAddSubView2()
  func screen1DidSelectToRemoveSubView2()
  func screen1DidSelectToGoToNextScreen()
  func screen1DidSetGlobalCount(_ value: Int)
  func screen1DidSetLocalCount(_ value: Int)
}

@MainActor protocol Screen1PublisherContainer {
  var actionPublisher: AnyPublisher<Screen1Action, Never> { get }
}

@MainActor final class Screen1StateContainer: ObservableObject {
  @Published fileprivate(set) var globalCount: Int = 0
  @Published fileprivate(set) var localCount: Int = 0
}

final class Screen1InteractorImpl: Screen1Interactor, Screen1PublisherContainer {
  var actionPublisher: AnyPublisher<Screen1Action, Never> { actionSubject.eraseToAnyPublisher() }

  private let router: Screen1Router
  private let stateContainer: Screen1StateContainer

  private let actionSubject = PassthroughSubject<Screen1Action, Never>()
  private var cancellables = Set<AnyCancellable>()

  private let someManager: SomeManager

  init(router: Screen1Router,
       stateContainer: Screen1StateContainer,
       someManager: SomeManager) {
    self.router = router
    self.stateContainer = stateContainer
    self.someManager = someManager

    subscribeToSomeManager()
  }

  func screen1DidSelectToAddSubView1() {
    _ = router.attachSubView1()
  }

  func screen1DidSelectToRemoveSubView1() {
    router.detachSubView1()
  }

  func screen1DidSelectToAddSubView2() {
    _ = router.attachSubView2()
  }

  func screen1DidSelectToRemoveSubView2() {
    router.detachSubView2()
  }

  func screen1DidSelectToGoToNextScreen() {
    actionSubject.send(.goToNextScreen)
  }

  func screen1DidSetGlobalCount(_ value: Int) {
    someManager.updateCount(value - stateContainer.globalCount)
  }

  func screen1DidSetLocalCount(_ value: Int) {
    stateContainer.localCount = stateContainer.localCount + value - stateContainer.localCount
  }

  private func subscribeToSomeManager() {
    someManager.countPublisher
      .receive(on: DispatchQueue.main)
      .assign(to: \.globalCount, on: stateContainer)
      .store(in: &cancellables)
  }
}
