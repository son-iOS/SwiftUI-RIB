//
//  Screen1SubView1View.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct Screen1SubView1View: View {
  @ObservedObject private var stateContainer: Screen1SubView1StateContainer
  @ObservedObject private var viewContainer: Screen1SubView1ViewContainer
  
  private let interactor: Screen1SubView1Interactor

  init(interactor: Screen1SubView1Interactor,
       stateContainer: Screen1SubView1StateContainer,
       viewContainer: Screen1SubView1ViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    Text("Screen1SubView1")
  }
}
