//
//  UsersPresenter.swift
//  TestQuandooTask
//
//  Created by Hrybeniuk Mykola on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

protocol UsersLoaderManager {
    func loadUsersList(_ handler:@escaping CompletionHandler<UserModel>)
}

protocol UsersListShowing : LoadingController {
    func show(_ users: [UserViewModel])
}

protocol UserPostsNavigator : class {
    func showPosts(with userViewModel: UserViewModel)
}

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
        usersLoader.loadUsersList {[unowned self] (success, list, error) in
            self.usersListController.show(self.prepareUsersViewModels(from:list))
            self.usersListController.stopLoading()
        }
    }
    
    func doOnSelect(_ userViewModel: UserViewModel) {
        userPostsNavigator.showPosts(with: userViewModel)
    }
    
    private func prepareUsersViewModels(from userModels: [UserModel]?) -> [UserViewModel] {
        return userModels?.map{ UserViewModel(with: $0) } ?? []
    }
}
