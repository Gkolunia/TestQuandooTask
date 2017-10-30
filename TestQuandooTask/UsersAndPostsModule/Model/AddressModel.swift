//
//  AddressModel.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

/// Address model is parsed from json.
struct AddressModel : Codable {
    let street : String
    let suite : String
    let city : String
    let zipcode : String
}
