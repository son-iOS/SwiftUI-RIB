//___FILEHEADER___

final class ___VARIABLE_productName___Builder {

  private let dependency: ___VARIABLE_productName___Dependency

  init(withDependency dependency: ___VARIABLE_productName___Dependency) {
    self.dependency = dependency
  }

  func build() -> ___VARIABLE_productName___Output {
    let viewContainer = ___VARIABLE_productName___ViewContainer()
    let router = ___VARIABLE_productName___RouterImpl(
      viewContainer: viewContainer
    )
    
    let stateContainer = ___VARIABLE_productName___StateContainer()
    let interactor = ___VARIABLE_productName___InteractorImpl(
      router: router,
      stateContainer: stateContainer
    )

    let view = ___VARIABLE_productName___View(
      interactor: interactor,
      stateContainer: stateContainer,
      viewContainer: viewContainer
    )

    return ___VARIABLE_productName___Output(view: view, publishers: interactor)
  }
}
