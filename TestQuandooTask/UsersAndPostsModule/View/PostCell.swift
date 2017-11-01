//
//  PostCell.swift
//  TestQuandooTask
//
//  Created by Hrybeniuk Mykola on 11/1/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

/// Cell for showing post view model.
class PostCell: UITableViewCell, ConfigurableCell {
    typealias T = PostViewModel
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    func setup(with item: T) {
        titleLabel.text = item.title
        bodyLabel.text = item.body
    }
    
}
