//___FILEHEADER___

import Foundation

@MainActor protocol ___VARIABLE_productName___Router: AnyObject {}

@MainActor final class ___VARIABLE_productName___ViewContainer: ObservableObject {}

final class ___VARIABLE_productName___RouterImpl: ___VARIABLE_productName___Router {
  private let viewContainer: ___VARIABLE_productName___ViewContainer
  
  init(viewContainer: ___VARIABLE_productName___ViewContainer) {
    self.viewContainer = viewContainer
  }
}
