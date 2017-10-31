//
//  UsersPresenter.swift
//  TestQuandooTask
//
//  Created by Hrybeniuk Mykola on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

/// Manager which can provide list of users.
protocol UsersLoaderManager {
    func loadUsersList(_ handler:@escaping CompletionHandler<UserModel>)
}

/// Controller which shows list of users
protocol UsersListShowing : LoadingController {
    func show(_ users: [UserViewModel])
}

/// Coordinator which make navigation to posts by particular user.
protocol UserPostsNavigator : class {
    
    /// Navigate to posts list.
    ///
    /// - Parameter userViewModel: Model of user 
    func showPosts(with userViewModel: UserViewModel)
}

/// Implementation of preparing users list view models for showing them in controller.
class UsersPresenter : UsersListPreparing {
    let usersLoader : UsersLoaderManager
    unowned let usersListController : UsersListShowing
    
    weak var userPostsNavigator : UserPostsNavigator!
    
    init(_ defaultUsersLoader : UsersLoaderManager, _ defaultUserListController: UsersListShowing) {
        usersLoader = defaultUsersLoader
        usersListController = defaultUserListController
    }
    
    func loadUsersList() {
        usersListController.startLoading()
        usersLoader.loadUsersList {[weak self] (success, list, error) in
            self?.usersListController.show((self?.prepareUsersViewModels(from:list))!)
            self?.usersListController.stopLoading()
        }
    }
    
    func doOnSelect(_ userViewModel: UserViewModel) {
        userPostsNavigator.showPosts(with: userViewModel)
    }
    
    /// Creating view models from models
    ///
    /// - Parameter userModels: Array of user models
    /// - Returns: List of user view models.
    private func prepareUsersViewModels(from userModels: [UserModel]?) -> [UserViewModel] {
        return userModels?.map{ UserViewModel(with: $0) } ?? []
    }
}
