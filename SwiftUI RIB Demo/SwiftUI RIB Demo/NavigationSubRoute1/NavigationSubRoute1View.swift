//
//  NavigationSubRoute1View.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct NavigationSubRoute1View: View {
  @ObservedObject private var stateContainer: NavigationSubRoute1StateContainer
  @ObservedObject private var viewContainer: NavigationSubRoute1ViewContainer
  
  private let interactor: NavigationSubRoute1Interactor

  init(interactor: NavigationSubRoute1Interactor,
       stateContainer: NavigationSubRoute1StateContainer,
       viewContainer: NavigationSubRoute1ViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    NavigationStack {
      Text("This is a new navigation stack, responsible for a self-managed sub-route")
      Button("Close") { interactor.subRoute1DidClose() }
    }
  }
}
