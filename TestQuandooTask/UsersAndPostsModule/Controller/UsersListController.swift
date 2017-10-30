//
//  UsersListController.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

/// Interface of class which prepares list of users.
protocol UsersListPreparing {
    
    /// Make loading of users list.
    func loadUsersList()
    
    /// Do action on selecting one of users from list.
    func doOnSelect(_ userViewModel: UserViewModel)
}

/// Controller which configurates view for showing users list.
class UsersListController: BaseTableViewController, UsersListShowing {

    var presenter : UsersListPreparing!
    private var tableViewConfigurator = GenericTableViewConfigurator<UserCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        presenter.loadUsersList()
        tableViewConfigurator.configurate(tableView) //Configurate table view for users list.
        tableViewConfigurator.selectionHandler = {[unowned self] (userViewModel) in
            self.presenter.doOnSelect(userViewModel)
        }
    }
    
    func show(_ users: [UserViewModel]) {
        tableViewConfigurator.dataSource = users
    }
    
}
