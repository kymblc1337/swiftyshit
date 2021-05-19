//
//  MainScreenInteractor.swift
//  pryaniky.com_test
//
//  Created by kymblc on 03.02.2021.
//  
//

import Foundation

final class MainScreenInteractor {
	weak var output: MainScreenInteractorOutput?

}

extension MainScreenInteractor: MainScreenInteractorInput {
    func fetchAllPosts() {
        NetworkService.shared.fetchAllContent { data in
            if let error = data.error {
                self.output?.errorRecieve(text: error.localizedDescription)
            }
            guard let posts = data.array else {
                self.output?.errorRecieve(text: "Error reading posts")
                return
            }
            self.output?.postsReceived(posts: posts)
        }
    }
    
}
