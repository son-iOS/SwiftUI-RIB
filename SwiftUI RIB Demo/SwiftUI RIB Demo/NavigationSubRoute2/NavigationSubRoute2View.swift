//
//  NavigationSubRoute2View.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct NavigationSubRoute2View: View {
  @ObservedObject private var stateContainer: NavigationSubRoute2StateContainer
  @ObservedObject private var viewContainer: NavigationSubRoute2ViewContainer
  
  private let interactor: NavigationSubRoute2Interactor

  init(interactor: NavigationSubRoute2Interactor,
       stateContainer: NavigationSubRoute2StateContainer,
       viewContainer: NavigationSubRoute2ViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    NavigationStack {
      Text("This is a new navigation stack, responsible for a self-managed sub-route")
      Button("Close") { interactor.subRoute2DidClose() }
    }
  }
}
