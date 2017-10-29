//
//  UserModel.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

struct UserModel : Codable {
    let id : Int
    let username : String
    let name : String
    let email : String
    let address : AddressModel
}
