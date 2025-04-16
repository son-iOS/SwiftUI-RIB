//
//  Screen2View.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct Screen2View: View {
  @ObservedObject private var stateContainer: Screen2StateContainer
  @ObservedObject private var viewContainer: Screen2ViewContainer
  
  private let interactor: Screen2Interactor

  init(interactor: Screen2Interactor,
       stateContainer: Screen2StateContainer,
       viewContainer: Screen2ViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    Text("Screen2")
    Button("Go back") { interactor.screen2DidClose() }
    Button("Sub-Route 1") { interactor.screen2DidSelectSubRoute1() }
      .fullScreenCover(
        isPresented: Binding<Bool>(
          get: { viewContainer.subRoute1 != nil },
          set: { _ in /* View doesn't manage navigation, Router does */ }
        ),
        content: { viewContainer.subRoute1 }
      )
    Button("Sub-Route 2") { interactor.screen2DidSelectSubRoute2() }
      .fullScreenCover(
        isPresented: Binding<Bool>(
          get: { viewContainer.subRoute2 != nil },
          set: { _ in /* View doesn't manage navigation, Router does */ }
        ),
        content: { viewContainer.subRoute2 }
      )
  }
}
