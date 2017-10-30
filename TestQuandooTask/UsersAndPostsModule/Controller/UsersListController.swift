//
//  UsersListController.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

protocol UsersListPreparing {
    func loadUsersList()
    func doOnSelect(_ userViewModel: UserViewModel)
}

class UsersListController: BaseTableViewController, UsersListShowing {

    var presenter : UsersListPreparing!
    private var tableViewConfigurator = GenericTableViewConfigurator<UserCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        presenter.loadUsersList()
        tableViewConfigurator.configurate(tableView)
        tableViewConfigurator.selectionHandler = {[unowned self] (userViewModel) in
            self.presenter.doOnSelect(userViewModel)
        }
    }
    
    func show(_ users: [UserViewModel]) {
        tableViewConfigurator.dataSource = users
    }
    
}
