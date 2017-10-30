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
    let name : String = "Name"
}

class CellMock: UITableViewCell, ConfigurableCell {
    typealias T = CellModelStub
    
    func setup(with item: CellMock.T) {
        self.textLabel?.text = item.name
    }
    
    static func cellId() -> String {
        return "cellId"
    }
    
}

class GenericTableViewDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCellForRowAtIndexPathTest() {
        let dataSource = [CellModelStub()]
        let tableViewStub = UITableView()
        tableViewStub.register(CellMock.self, forCellReuseIdentifier: CellMock.cellId())
        let tableViewDataSource = GenericTableViewDataSource<CellMock>(defaultDataSource: dataSource)
        let cell = tableViewDataSource.tableView(tableViewStub, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssert(cell.textLabel?.text == dataSource[0].name)
    }
    
}
