//
//  UsersAndPostsCoordinatorTests.swift
//  TestQuandooTaskTests
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import XCTest
@testable import TestQuandooTask

class UsersAndPostsCoordinatorTests: XCTestCase {
    
    var childCoordinator : UsersAndPostsCoordinator? = UsersAndPostsCoordinator()
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        childCoordinator = nil
    }

    func testInitWithManager() {

    }

    func testStartUsersAndPostsCoordinator() {
        let navigationController = UINavigationController()
        childCoordinator?.start(from: navigationController)
        XCTAssert(navigationController.viewControllers.count > 0, "First Controller has not been pushed.") // On start coordinator should push first view controller to the stack
        if let usersList = navigationController.viewControllers[0] as? UsersListController {
            XCTAssert(usersList.presenter != nil, "Coordinator should set presenter")
        }
        else {
            XCTFail("First pushed controller should be UsersListController")
        }
        
    }
    
}
