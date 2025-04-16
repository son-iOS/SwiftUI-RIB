//
//  ContentView.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    let dependency = MainDependency()
    let builder = MainBuilder(withDependency: dependency)
    builder.build().view
  }
}
