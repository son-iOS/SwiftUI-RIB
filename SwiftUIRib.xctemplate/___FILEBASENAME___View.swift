//___FILEHEADER___

import SwiftUI

struct ___VARIABLE_productName___View: View {
  @ObservedObject private var stateContainer: ___VARIABLE_productName___StateContainer
  @ObservedObject private var viewContainer: ___VARIABLE_productName___ViewContainer
  
  private let interactor: ___VARIABLE_productName___Interactor

  init(interactor: ___VARIABLE_productName___Interactor,
       stateContainer: ___VARIABLE_productName___StateContainer,
       viewContainer: ___VARIABLE_productName___ViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    Text("___VARIABLE_productName___")
  }
}
