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

    func testStartUsersAndPostsCoordinator() {
        let childCoordinator = UsersAndPostsCoordinator()
        let navigationController = UINavigationController()
        childCoordinator.start(from: navigationController)
        XCTAssert(navigationController.viewControllers.count > 0, "First Controller has not been pushed.") // On start coordinator should push first view controller to the stack
        if let usersList = navigationController.topViewController as? UsersListController {
            XCTAssertTrue(usersList.presenter != nil, "Coordinator should set presenter")
        }
        else {
            XCTFail("First pushed controller should be UsersListController")
        }
    }
    
    func testShowPosts() {
        let childCoordinator = UsersAndPostsCoordinator()
        let navigationController = UINavigationController()
        childCoordinator.start(from: navigationController)
        
        let wait = self.expectation(description: "Wait for push view controller")
        
        childCoordinator.showPosts(with: UserViewModel(with: ModelsStub.userModel))
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            if let usersList = navigationController.topViewController as? PostsListController {
                XCTAssertTrue(usersList.postsPresenter != nil, "")
            }
            else {
                XCTFail("")
            }
            wait.fulfill()
        }
        self.waitForExpectations(timeout: 1)
    }
    
}
