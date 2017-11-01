//
//  UsersAndPostsCoordinator.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

/// Coordinator for implementing navigation in user's posts module.
class UsersAndPostsCoordinator: CoordinatorProtocol, UserPostsNavigator {
    
    weak var rootController : UINavigationController!
    
    func showPosts(with userViewModel: UserViewModel) {
        let postsController = UIStoryboard.postsListController()
        postsController.postsPresenter = PostsPresenter(ServiceManager(), postsController, userViewModel)
        rootController.pushViewController(postsController, animated: true)
    }
    
    func start(from navigationController: UINavigationController) {
        rootController = navigationController
        let usersListController = UIStoryboard.usersListController()
        let usersPresenter = UsersPresenter(ServiceManager(), usersListController)
        usersPresenter.userPostsNavigator = self
        usersListController.presenter = usersPresenter
        rootController.pushViewController(usersListController, animated: true)
    }

}
