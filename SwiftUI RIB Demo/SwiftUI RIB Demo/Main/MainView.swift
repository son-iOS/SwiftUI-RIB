//
//  MainView.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct MainView: View {
  @ObservedObject private var stateContainer: MainStateContainer
  @ObservedObject private var viewContainer: MainViewContainer
  
  private let interactor: MainInteractor

  init(interactor: MainInteractor,
       stateContainer: MainStateContainer,
       viewContainer: MainViewContainer) {
    self.interactor = interactor
    self.stateContainer = stateContainer
    self.viewContainer = viewContainer
  }

  var body: some View {
    NavigationStack(
      path: Binding<[MainRoute]>(
        get: { viewContainer.screens },
        set: { _ in /* View do not manage its navigation, Router does */ }
      ),
      root: {
        Text("Main Root")
          .navigationDestination(for: MainRoute.self, destination: { screen in
            switch screen {
            case .screen1:
              viewContainer.screen1?
                .toolbar(.hidden)
            case .screen2:
              viewContainer.screen2?
                .toolbar(.hidden)
            }
          })
      }
    )
  }
}
