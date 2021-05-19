//
//  CalculateScreenPresenter.swift
//  Alcoholic
//
//  Created by kymblc on 31.01.2021.
//  
//

import Foundation

final class CalculateScreenPresenter {
	weak var view: CalculateScreenViewInput?
    var model: PredictionModel!

	private let router: CalculateScreenRouterInput
	private let interactor: CalculateScreenInteractorInput

    init(router: CalculateScreenRouterInput, interactor: CalculateScreenInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CalculateScreenPresenter: CalculateScreenViewOutput {
    func didLoadView() {
        view?.setRedTime(time: model.fastestTime)
        view?.setYellowTime(time: model.mediumTime)
        view?.setGreenTime(time: model.longestTime)
    }
    
    func didTapOnWhatIsButton() {
        router.routeToWhatIsScreen()
    }
    
    func didTapOnBackButton() {
        router.routeBackToMainScreen()
    }
    
}

extension CalculateScreenPresenter: CalculateScreenInteractorOutput {
}


