//
//  MainScreenRouter.swift
//  Alcoholic
//
//  Created by kymblc on 02.02.2021.
//  
//

import UIKit

final class MainScreenRouter {
    weak var viewController: UIViewController?
}

extension MainScreenRouter: MainScreenRouterInput {
    func showResultsScreen() {
        let model = PredictionModel(fastestTime: TimeLeft(hours: 5, minutes: 12),
                                    mediumTime: TimeLeft(hours: 8, minutes: 10),
                                    longestTime: TimeLeft(hours: 12, minutes: 55))
        let vc = CalculateScreenContainer.assemble(with: CalculateScreenContext(prediction: model)).viewController
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
