//
//  MainScreenContainer.swift
//  Alcoholic
//
//  Created by kymblc on 02.02.2021.
//  
//

import UIKit

final class MainScreenContainer {
	let viewController: UIViewController
	private(set) weak var router: MainScreenRouterInput!

	class func assemble(with context: MainScreenContext) -> MainScreenContainer {
        let router = MainScreenRouter()
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(router: router, interactor: interactor)
		let viewController = MainScreenViewController()

        viewController.output = presenter
        router.viewController = viewController
		presenter.view = viewController
		interactor.output = presenter
        
        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true

        return MainScreenContainer(view: navigationVC, router: router)
	}

    private init(view: UIViewController, router: MainScreenRouterInput) {
		self.viewController = view
		self.router = router
	}
}

struct MainScreenContext {
}
