//
//  UserViewModel.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

struct UserViewModel {
    let fullName : String
    let userName : String
    let email : String
    let address : String
    let id : Int
    
    init(with userModel : UserModel) {
        id = userModel.id
        fullName = userModel.name
        userName = userModel.username
        email = userModel.email
        address = userModel.address.street+" "+userModel.address.suite+", "+userModel.address.zipcode+", "+userModel.address.city
    }
    
}
