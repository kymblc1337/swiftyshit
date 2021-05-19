//
//  MainScreenProtocols.swift
//  Alcoholic
//
//  Created by kymblc on 02.02.2021.
//  
//

import Foundation

protocol MainScreenViewInput: class {
}

protocol MainScreenViewOutput: class {
    func didTapCalculate()
}

protocol MainScreenInteractorInput: class {
}

protocol MainScreenInteractorOutput: class {
}

protocol MainScreenRouterInput: class {
    func showResultsScreen()
}
