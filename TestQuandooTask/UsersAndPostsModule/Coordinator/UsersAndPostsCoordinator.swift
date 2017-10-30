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
    
    weak var rootController : UIViewController?
    
    func showPosts(with userViewModel: UserViewModel) {
        
    }
    
    func start(from navigationController: UIViewController) {
        rootController = navigationController
        let usersListController = UIStoryboard.usersListController()
        let usersPresenter = UsersPresenter(ServiceManager(), usersListController)
        usersPresenter.userPostsNavigator = self
        usersListController.presenter = usersPresenter
        navigationController.show(usersListController, sender: nil)
    }

}
