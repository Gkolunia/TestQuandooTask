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
    var userViewModel : UserViewModel { get }
    func loadPosts()
}

class PostsListController: BaseTableViewController, ShowingPostsList {

    var postsPresenter : PostsListPreparing!
    private var tableViewConfigurator = GenericTableViewConfigurator<PostCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = postsPresenter.userViewModel.fullName
        tableViewConfigurator.configurate(tableView)
        postsPresenter.loadPosts()
    }
    
    func showPosts(_ posts: [PostViewModel]) {
        tableViewConfigurator.dataSource = posts
    }
    
}
