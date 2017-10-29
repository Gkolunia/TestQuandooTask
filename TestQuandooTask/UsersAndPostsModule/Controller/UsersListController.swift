//
//  UsersListController.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

class UsersListController: BaseTableViewController, UsersListControllerProtocol, UITableViewDelegate {

    var presenter : UsersPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        presenter?.loadUsersList()
    }
    
    func show(_ users: [UserViewModel]) {
        tableView.register(UINib.init(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: UserCell.cellId())
        dataSource = GenericTableViewDataSource<UserCell>(defaultDataSource: users)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    // UITableViewDelegate - protocol
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
