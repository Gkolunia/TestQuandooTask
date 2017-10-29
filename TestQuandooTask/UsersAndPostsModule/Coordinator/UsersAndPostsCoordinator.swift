//
//  UsersAndPostsCoordinator.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

protocol LoadingControllerProtocol : class {
    func startLoading()
    func stopLoading()
}

protocol UsersLoaderManagerProtocol {
    func loadUsersList(_ handler:@escaping CompletionHandler<UserModel>)
}

protocol UsersListControllerProtocol : LoadingControllerProtocol {
    func show(_ users: [UserViewModel])
}

protocol UserPostsNavigatorProtocol {
    func showPosts(with userViewModel: UserViewModel)
}

class UsersPresenter {
    let usersLoader : UsersLoaderManagerProtocol
    weak var usersListController : UsersListControllerProtocol?
    
    init(_ defaultUsersLoader : UsersLoaderManagerProtocol, _ defaultUserListController: UsersListControllerProtocol) {
        usersLoader = defaultUsersLoader
        usersListController = defaultUserListController
    }
    
    func loadUsersList() {
        usersListController?.startLoading()
        usersLoader.loadUsersList {[unowned self] (success, list, error) in
            self.usersListController?.show(self.prepareUsersViewModels(from:list))
            self.usersListController?.stopLoading()
        }
    }
    
    private func prepareUsersViewModels(from userModels: [UserModel]?) -> [UserViewModel] {
        var arrayOfModelView = [UserViewModel]()
        if let userModels = userModels {
            for userModel in userModels {
                arrayOfModelView.append(UserViewModel(with: userModel))
            }
        }
        return arrayOfModelView
    }
}

/// Coordinator for implementing navigation in user's posts module.
class UsersAndPostsCoordinator: CoordinatorProtocol, UserPostsNavigatorProtocol {
    
    func showPosts(with userViewModel: UserViewModel) {
        
    }
    
    func start(from navigationController: UIViewController) {
        let usersListController = UIStoryboard.usersListController()
        let usersPresenter = UsersPresenter(ServiceManager(), usersListController)
        usersListController.presenter = usersPresenter
        navigationController.show(usersListController, sender: nil)
    }

}
