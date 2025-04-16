//
//  Screen1View.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct Screen1View: View {
  @ObservedObject private var stateContainer: Screen1StateContainer
  @ObservedObject private var viewContainer: Screen1ViewContainer
  
  private let interactor: Screen1Interactor

  init(interactor: Screen1Interactor,
       stateContainer: Screen1StateContainer,
       viewContainer: Screen1ViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    VStack {
      if let subView1 = viewContainer.subView1 {
        subView1
        Button("Remove sub-view 1") { interactor.screen1DidSelectToRemoveSubView1() }
      } else {
        Button("Add sub-view 1") { interactor.screen1DidSelectToAddSubView1() }
      }
      if let subView2 = viewContainer.subView2 {
        subView2
        Button("Remove sub-view 2") { interactor.screen1DidSelectToRemoveSubView2() }
      } else {
        Button("Add sub-view 2") { interactor.screen1DidSelectToAddSubView2() }
      }
      Stepper(
        "Global Count: \(stateContainer.globalCount)",
        value: Binding<Int>(
          get: { stateContainer.globalCount },
          set: { interactor.screen1DidSetGlobalCount($0) }
        )
      )
      .frame(width: 250)
      Stepper(
        "Local Count: \(stateContainer.localCount)",
        value: Binding<Int>(
          get: { stateContainer.localCount },
          set: { interactor.screen1DidSetLocalCount($0) }
        )
      )
      .frame(width: 250)
      Button("Go to next screen") { interactor.screen1DidSelectToGoToNextScreen() }
    }
    .padding()
    .animation(.bouncy, value: viewContainer.subView1 != nil)
    .animation(.bouncy, value: viewContainer.subView2 != nil)
  }
}
