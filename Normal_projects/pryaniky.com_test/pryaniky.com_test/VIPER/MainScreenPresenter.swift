//
//  MainScreenPresenter.swift
//  pryaniky.com_test
//
//  Created by kymblc on 03.02.2021.
//  
//

import Foundation

final class MainScreenPresenter {
	weak var view: MainScreenViewInput?
    private var model: [AnyModel]? {
        didSet {
            view?.updateTableView()
        }
    }

	private let router: MainScreenRouterInput
	private let interactor: MainScreenInteractorInput

    init(router: MainScreenRouterInput, interactor: MainScreenInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainScreenPresenter: MainScreenViewOutput {
    func didSelectSegment(segmentName: String) {
        router.logUserAction(text: "User selected \(segmentName) segment")
    }
    
    func didLoadView() {
        interactor.fetchAllPosts()
    }
    
    func didTapOnCell(index: IndexPath) {
        guard let model = self.model?[index.row] else { return }
        guard let viewName = model.name else {
            router.logUserAction(text: "User tapped model with unkown name (number of index: \(index.row)")
            return
        }
        router.logUserAction(text: "User tapped model \(viewName)")
        
    }
    
    func getCellAtIndex(index: IndexPath) -> AnyModel? {
        guard let model = self.model else { return nil }
        return model[index.row]
    }
    
    var numbersOfItems: Int {
        guard let model = self.model else { return 0 }
        return model.count
    }
    
}

extension MainScreenPresenter: MainScreenInteractorOutput {
    func postsReceived(posts: [AnyModel]) {
        self.model = posts
    }
    
    func errorRecieve(text: String) {
        router.showError(text: text)
    }
    
}


