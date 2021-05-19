import UIKit

final class MainScreenRouter {
    weak var viewController: UIViewController?
}

extension MainScreenRouter: MainScreenRouterInput {
    func logUserAction(text: String) {
        let alert = UIAlertController(title: "User log", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true)
    }
    
    func showError(text: String) {
        let alert = UIAlertController(title: "Error happend", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true)
    }
}
