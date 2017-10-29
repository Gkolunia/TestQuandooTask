//
//  AppCoordinatorTests.swift
//  TestQuandooTaskTests
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import XCTest
@testable import TestQuandooTask

class AppCoordinatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitWithWindow() {
        let window = UIWindow()
        let _ = AppCoordinator(window)
        XCTAssert(window.isKeyWindow) //Window should be as key window
        XCTAssert(window.rootViewController != nil) // And has root view controller
    }
    
    func testStartAppCoordinator() {
        let coordinator = AppCoordinator(UIWindow())
        coordinator.start()
        XCTAssert(coordinator.childCoordinator != nil) // On start child coordinator should be set.
    }
    
    
}
