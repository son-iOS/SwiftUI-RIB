//
//  Screen1Router.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import Foundation

@MainActor protocol Screen1Router: AnyObject {
  func attachSubView1() -> Screen1SubView1Output
  func detachSubView1()
  func attachSubView2() -> Screen1SubView2Output
  func detachSubView2()
}

@MainActor final class Screen1ViewContainer: ObservableObject {
  @Published fileprivate(set) var subView1: Screen1SubView1View?
  @Published fileprivate(set) var subView2: Screen1SubView2View?
}

final class Screen1RouterImpl: Screen1Router {
  private let viewContainer: Screen1ViewContainer
  
  init(viewContainer: Screen1ViewContainer) {
    self.viewContainer = viewContainer
  }

  func attachSubView1() -> Screen1SubView1Output {
    let dependency = Screen1SubView1Dependency()
    let builder = Screen1SubView1Builder(withDependency: dependency)
    let output = builder.build()
    viewContainer.subView1 = output.view
    return output
  }

  func detachSubView1() {
    viewContainer.subView1 = nil
  }

  func attachSubView2() -> Screen1SubView2Output {
    let dependency = Screen1SubView2Dependency()
    let builder = Screen1SubView2Builder(withDependency: dependency)
    let output = builder.build()
    viewContainer.subView2 = output.view
    return output
  }

  func detachSubView2() {
    viewContainer.subView2 = nil
  }
}
