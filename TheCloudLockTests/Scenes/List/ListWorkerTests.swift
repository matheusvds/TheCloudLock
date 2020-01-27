//
//  ListWorkerTests.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

class ListWorkerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: ListWorker!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupDoorsWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupDoorsWorker() {
        sut = ListWorker(cloudLockAPI: CloudLockAPI())
    }
    
    // MARK: - Test
    
    func testFetchItemsShouldAskAPIToFetchItems() {
        let spy = CloudLockAPISpy()
        sut.cloudLockAPI = spy
        
        sut.fetchItems(type: Doors.self) { _ in }

        XCTAssertNotNil(spy.fetchItemsCalled, "fetchItems should ask api to fetchItems")
    }
    
    func testFetchItemsShouldReceiveErrorWhenAPIFails() {
        let fake = CloudLockAPIFake()
        fake.success = false
        sut.cloudLockAPI = fake
        var error: CloudLockError?
        
        let completed = expectation(description: "waiting block completion")
        sut.fetchItems(type: Doors.self) { result in
            error = result.error
            completed.fulfill()
        }
        
        let expected: CloudLockError? = .cannotFetchItems
        waitForExpectations(timeout: 2.0, handler: nil)
        XCTAssertEqual(error, expected, "fetchItems worker should reiceve error when api fails")
    }
}
