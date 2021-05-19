//
//  CalculateScreenRouter.swift
//  Alcoholic
//
//  Created by kymblc on 31.01.2021.
//  
//

import UIKit

final class CalculateScreenRouter {
    weak var viewController: UIViewController?
}

extension CalculateScreenRouter: CalculateScreenRouterInput {
    func routeToWhatIsScreen() {
        let vc = WhatIsViewController()
        vc.modalPresentationStyle = .popover
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func routeBackToMainScreen() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
