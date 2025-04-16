//
//  Screen1SubView2View.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct Screen1SubView2View: View {
  @ObservedObject private var stateContainer: Screen1SubView2StateContainer
  @ObservedObject private var viewContainer: Screen1SubView2ViewContainer
  
  private let interactor: Screen1SubView2Interactor

  init(interactor: Screen1SubView2Interactor,
       stateContainer: Screen1SubView2StateContainer,
       viewContainer: Screen1SubView2ViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    Text("Screen1SubView2")
  }
}
