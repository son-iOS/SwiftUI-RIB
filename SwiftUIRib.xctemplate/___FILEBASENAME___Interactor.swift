//___FILEHEADER___

import Foundation

@MainActor protocol ___VARIABLE_productName___Interactor: AnyObject {}

@MainActor protocol ___VARIABLE_productName___PublisherContainer {}

@MainActor final class ___VARIABLE_productName___StateContainer: ObservableObject {}

final class ___VARIABLE_productName___InteractorImpl: ___VARIABLE_productName___Interactor, ___VARIABLE_productName___PublisherContainer {
  private let router: ___VARIABLE_productName___Router
  private let stateContainer: ___VARIABLE_productName___StateContainer

  init(router: ___VARIABLE_productName___Router,
       stateContainer: ___VARIABLE_productName___StateContainer) {
    self.router = router
    self.stateContainer = stateContainer
  }
}
