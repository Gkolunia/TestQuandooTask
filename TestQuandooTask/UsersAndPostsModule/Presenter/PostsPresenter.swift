//
//  PostsPresenter.swift
//  TestQuandooTask
//
//  Created by Hrybeniuk Mykola on 10/31/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

/// Interface of loading posts list
protocol PostsLoaderManager {
    func loadPostsList(with userId: Int, _ handler: @escaping (Bool, [PostModel]?, ErrorMessage?) -> ())
}

/// Interface for showing posts
protocol ShowingPostsList : LoadingController {
    func showPosts(_ posts: [PostViewModel])
}

/// Implementation of preparing post list view models for showing them in controller.
class PostsPresenter : PostsListPreparing {
    
    let userViewModel: UserViewModel
    let loaderManager : PostsLoaderManager
    let showingController : ShowingPostsList
    
    init(_ defaultLoaderManager: PostsLoaderManager, _ defaultShowingList : ShowingPostsList, _ defaultUserViewModel : UserViewModel) {
        showingController = defaultShowingList
        loaderManager = defaultLoaderManager
        userViewModel = defaultUserViewModel
    }
    
    func loadPosts() {
        showingController.startLoading()
        loaderManager.loadPostsList(with: userViewModel.id) {[weak self] (success, posts, error) in
            self?.showingController.showPosts(posts ?? [])
            self?.showingController.stopLoading()
        }
    }
    
}
