//
//  BaseTableViewController.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController, LoadingControllerProtocol {
    
	@IBOutlet weak var tableView: UITableView!
    
    var dataSource : UITableViewDataSource?
    
    func startLoading() {
    
    }
    
    func stopLoading() {
        
    }
    
}
