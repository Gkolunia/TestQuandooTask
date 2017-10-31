//
//  PostsListController.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

/// Interface of preparing posts list data
protocol PostsListPreparing {
    func loadPosts()
}

class PostsListController: BaseTableViewController, ShowingPostsList {

    var postsPresenter : PostsListPreparing!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User's posts"
        postsPresenter.loadPosts()
    }
    
    func showPosts(_ posts: [PostModel]) {
        
    }
    
}
