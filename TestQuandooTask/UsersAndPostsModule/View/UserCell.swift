//
//  UserCell.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

/// Cell for showing user view model.
class UserCell: UITableViewCell, ConfigurableCell {
    typealias T = UserViewModel
    
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    func setup(with item: T) {
        fullNameLabel.text = item.fullName
        userNameLabel.text = item.userName
        emailLabel.text = item.email
        addressLabel.text = item.address
    }
    
}
