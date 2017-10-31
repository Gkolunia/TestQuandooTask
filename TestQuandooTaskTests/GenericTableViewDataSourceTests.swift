//
//  GenericTableViewDataSourceTests.swift
//  TestQuandooTaskTests
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import XCTest
@testable import TestQuandooTask

struct CellModelStub {
}

class CellMock: UITableViewCell, ConfigurableCell {
    typealias T = CellModelStub
    var isSetupCalled = false
    
    func setup(with item: CellMock.T) {
        isSetupCalled = true
    }
}

class GenericTableViewDataSourceTests: XCTestCase {
       
    func cellForRowAtIndexPathTest() {
        let dataSource = [CellModelStub()]
        let tableViewStub = UITableView()
        let tableViewConfigurator = GenericTableViewConfigurator<CellMock>()
        tableViewConfigurator.configurate(tableViewStub)
        tableViewConfigurator.dataSource = dataSource
        tableViewConfigurator.bundleNib = Bundle.init(identifier: "ssss.TestQuandooTaskTests")!
        if let cell = tableViewConfigurator.tableView(tableViewStub, cellForRowAt: IndexPath(row: 0, section: 0)) as? CellMock {
            XCTAssert(cell.isSetupCalled)
        }
        else {
            XCTFail("Wrong cell is returned")
        }
    }
    
}
