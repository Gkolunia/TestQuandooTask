//
//  BaseTableViewController.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController {
    
	@IBOutlet weak var tableView: UITableView!
    
    var dataSource : UITableViewDataSource?
    var delegate : UITableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
}
