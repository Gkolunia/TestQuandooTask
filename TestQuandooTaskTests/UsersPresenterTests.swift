//
//  UsersPresenterTests.swift
//  TestQuandooTaskTests
//
//  Created by Hrybeniuk Mykola on 10/31/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import XCTest
@testable import TestQuandooTask

struct ModelsStub {
    static let addressModel = AddressModel(street: "street", suite: "suite 555", city: "cityName", zipcode: "29000")
    static let userModel = UserModel(id: 1, username: "username", name: "name", email: "email", address: AddressModel(street: "street", suite: "suite 555", city: "cityName", zipcode: "29000"))
}

class UsersLoaderManagerMock : UsersLoaderManager {
    
    var loadUserIsCalled = false
    
    func loadUsersList(_ handler: @escaping (Bool, [UserModel]?, ErrorMessage?) -> ()) {
        loadUserIsCalled = true
        handler(true, [ModelsStub.userModel], nil)
    }
}

class UsersListShowingMock : UsersListShowing {
    
    var showIsCalled = false
    var startLoadingIsCalled = false
    var stopLoadingIsCalled = false
    
    func show(_ users: [UserViewModel]) {
        showIsCalled = true
    }
    
    func startLoading() {
        startLoadingIsCalled = true
    }
    
    func stopLoading() {
        stopLoadingIsCalled = true
    }
    
}

class UserPostsNavigatorMock : UserPostsNavigator {
    
    var showPostsIsCalled = false
    
    func showPosts(with userViewModel: UserViewModel) {
        showPostsIsCalled = true
    }
    
}

class UsersPresenterTests: XCTestCase {

    var userLoaderMock : UsersLoaderManagerMock = UsersLoaderManagerMock()
    var usersListShowingMock : UsersListShowingMock = UsersListShowingMock()
    var userPostNavigatorMock : UserPostsNavigatorMock = UserPostsNavigatorMock()
    
    override func setUp() {
        super.setUp()
        userLoaderMock = UsersLoaderManagerMock()
        usersListShowingMock = UsersListShowingMock()
        userPostNavigatorMock = UserPostsNavigatorMock()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadUsers() {
        let presenter = UsersPresenter(userLoaderMock, usersListShowingMock)
        presenter.loadUsersList()
        XCTAssert(usersListShowingMock.startLoadingIsCalled, "start loading should appear on getting data")
        XCTAssert(userLoaderMock.loadUserIsCalled, "load users list should be called")
        XCTAssert(usersListShowingMock.showIsCalled, "shows lists users should be called")
        XCTAssert(usersListShowingMock.stopLoadingIsCalled, "after getting stop loading should be called")
    }
    
    func testDoOnSelect() {
        let presenter = UsersPresenter(userLoaderMock, usersListShowingMock)
        presenter.userPostsNavigator = userPostNavigatorMock
        presenter.doOnSelect(UserViewModel(with: ModelsStub.userModel))
        XCTAssert(userPostNavigatorMock.showPostsIsCalled, "start loading should appear on getting data")
    }
    
}
