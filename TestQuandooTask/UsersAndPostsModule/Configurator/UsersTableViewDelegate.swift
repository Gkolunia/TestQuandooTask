//
//  UsersTableViewDelegate.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

class UsersTableViewDelegate: NSObject, UITableViewDelegate {
    
    /// Call back - is called when something is selected from table view.
    var selectionHandler: ((_ selectedItem: UserModel) -> ())?
    
}
