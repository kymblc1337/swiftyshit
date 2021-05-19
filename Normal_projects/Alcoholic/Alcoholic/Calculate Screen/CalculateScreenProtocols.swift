//
//  CalculateScreenProtocols.swift
//  Alcoholic
//
//  Created by kymblc on 31.01.2021.
//  
//

import Foundation

protocol CalculateScreenViewInput: class {
    func setRedTime(time: TimeLeft)
    func setYellowTime(time: TimeLeft)
    func setGreenTime(time: TimeLeft)
}

protocol CalculateScreenViewOutput: class {
    func didLoadView()
    func didTapOnWhatIsButton()
    func didTapOnBackButton()
}

protocol CalculateScreenInteractorInput: class {
}

protocol CalculateScreenInteractorOutput: class {
}

protocol CalculateScreenRouterInput: class {
    func routeToWhatIsScreen()
    func routeBackToMainScreen()
}
