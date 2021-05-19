import Foundation

final class MainScreenPresenter {
	weak var view: MainScreenViewInput?

	private let router: MainScreenRouterInput
	private let interactor: MainScreenInteractorInput

    init(router: MainScreenRouterInput, interactor: MainScreenInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainScreenPresenter: MainScreenViewOutput {
    func didTapCalculate() {
        router.showResultsScreen()
    }
    
}

extension MainScreenPresenter: MainScreenInteractorOutput {
}


