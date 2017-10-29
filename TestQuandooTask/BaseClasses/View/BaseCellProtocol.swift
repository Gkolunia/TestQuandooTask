//
//  BaseCellProtocol.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

protocol BaseCellProtocol {
    associatedtype ItemType
    
    static func cellId() -> String
    
    func setup(with item: ItemType)
}
