import UIKit

final class CalculateScreenContainer {
	let viewController: UIViewController
	private(set) weak var router: CalculateScreenRouterInput!

	class func assemble(with context: CalculateScreenContext) -> CalculateScreenContainer {
        let router = CalculateScreenRouter()
        let interactor = CalculateScreenInteractor()
        let presenter = CalculateScreenPresenter(router: router, interactor: interactor)
		let viewController = CalculateScreenViewController()

        viewController.output = presenter
		presenter.view = viewController
        presenter.model = context.prediction
        router.viewController = viewController
		interactor.output = presenter

        return CalculateScreenContainer(view: viewController, router: router)
	}

    private init(view: UIViewController, router: CalculateScreenRouterInput) {
		self.viewController = view
		self.router = router
	}
}

struct CalculateScreenContext {
    let prediction: PredictionModel
}
