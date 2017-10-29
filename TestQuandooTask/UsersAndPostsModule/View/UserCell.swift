//
//  UserCell.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell, BaseCellProtocol {
    typealias T = UserModel
    
    func setup(with item: UserCell.T) {
        self.textLabel?.text = item.username
    }
    
    static func cellId() -> String {
        return "UserCellId"
    }
    
}
