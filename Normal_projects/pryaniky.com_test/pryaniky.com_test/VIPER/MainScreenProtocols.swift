import Foundation

protocol MainScreenViewInput: AnyObject {
    func updateTableView()
}

protocol MainScreenViewOutput: AnyObject {
    func didLoadView()
    func didTapOnCell(index: IndexPath)
    func didSelectSegment(segmentName: String)
    func getCellAtIndex(index: IndexPath) -> AnyModel?
    var numbersOfItems: Int { get }
}

protocol MainScreenInteractorInput: AnyObject {
    func fetchAllPosts()
}

protocol MainScreenInteractorOutput: AnyObject {
    func postsReceived(posts: [AnyModel])
    func errorRecieve(text: String)
}

protocol MainScreenRouterInput: AnyObject {
    func showError(text: String)
    func logUserAction(text: String)
}
