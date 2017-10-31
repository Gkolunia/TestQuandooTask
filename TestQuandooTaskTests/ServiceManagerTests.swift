//
//  ServiceManagerTests.swift
//  TestQuandooTaskTests
//
//  Created by Hrybeniuk Mykola on 10/31/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import XCTest
@testable import TestQuandooTask

struct ReturnedModelStub : Codable {

}

class URLSessionDataTaskStub : URLSessionDataTask {
    
    override func resume() {
        
    }
    
}

class ServiceManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSuccesMakeRequest() {
        if let request = ServiceManager().makeRequest("/urlPath", ["param1" : "value1"], .get) {
            XCTAssert(request.url?.absoluteString == "https://jsonplaceholder.typicode.com/urlPath?param1=value1")
        }
        else {
            XCTFail("Request url should be created with the parameters")
        }
    }
    
    func testFailureDoRequest() {
        
        class URLSessionMock : URLSession {
            override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
                completionHandler(nil, nil, nil)
                let dataTask = URLSessionDataTaskStub()
                return dataTask
            }
        }
        
        let serviceManager = ServiceManager()
        serviceManager.session = URLSessionMock()
        
        serviceManager.doRequest("/urlPathMock", ["param1" : "value1"], .get, handler: {(success, model : [ReturnedModelStub]?, error) in
            XCTAssertFalse(success, "Tested failure request")
        })
        
    }
    
}
