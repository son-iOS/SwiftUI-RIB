//
//  SomeManager.swift
//  SwiftUI RIB Demo
//
//  Created by Son Nguyen on 4/16/25.
//

@preconcurrency import Combine

protocol SomeManager: Sendable {
  var countPublisher: AnyPublisher<Int, Never> { get }

  func updateCount(_ change: Int)
}

final class SomeManagerImpl: SomeManager {
  var countPublisher: AnyPublisher<Int, Never> { countSubject.eraseToAnyPublisher() }

  private let countSubject = CurrentValueSubject<Int, Never>(0)

  func updateCount(_ change: Int) {
    countSubject.send(countSubject.value + change)
  }
}
