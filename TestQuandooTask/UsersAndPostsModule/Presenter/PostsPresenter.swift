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
    func loadPostsList(with userId: Int, _ handler: @escaping (Bool, [UserModel]?, ErrorMessage?) -> ())
}

/// Interface for showing posts
protocol ShowingPostsList : LoadingController {
    func showPosts(_ posts: [PostModel])
}

/// Implementation of preparing post list view models for showing them in controller.
class PostsPresenter : PostsListPreparing {
    
    let loaderManager : PostsLoaderManager
    let showingController : ShowingPostsList
    
    init(_ defaultLoaderManager: PostsLoaderManager, _ defaultShowingList : ShowingPostsList) {
        showingController = defaultShowingList
        loaderManager = defaultLoaderManager
    }
    
    func loadPosts() {
        
    }
    
}
