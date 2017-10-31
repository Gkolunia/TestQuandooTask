//
//  UserViewModelTests.swift
//  TestQuandooTaskTests
//
//  Created by Hrybeniuk Mykola on 10/31/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import XCTest
@testable import TestQuandooTask

class UserViewModelTests: XCTestCase {
    
    func testInit() {
        let userViewModel = UserViewModel(with: ModelsStub.userModel)
        let addressString = "street suite 555, 29000, cityName"
        XCTAssert(userViewModel.address == addressString, "View model should have the format of address")
    }
    
}
