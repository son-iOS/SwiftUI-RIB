//
//  Screen1SubView1Router.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol Screen1SubView1Router: AnyObject {}

@MainActor final class Screen1SubView1ViewContainer: ObservableObject {}

final class Screen1SubView1RouterImpl: Screen1SubView1Router {
  private let viewContainer: Screen1SubView1ViewContainer
  
  init(viewContainer: Screen1SubView1ViewContainer) {
    self.viewContainer = viewContainer
  }
}
