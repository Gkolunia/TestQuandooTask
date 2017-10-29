//
//  UserCell.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell, BaseCellProtocol {
    typealias T = UserViewModel
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func setup(with item: UserCell.T) {
        fullNameLabel.text = item.fullName
        userNameLabel.text = item.userName
        emailLabel.text = item.email
        addressLabel.text = item.address
    }
    
    static func cellId() -> String {
        return "UserCellId"
    }
    
}
