//
//  DetailWorkerTests.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

class DetailWorkerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: DetailWorker!
    
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
        sut = DetailWorker(cloudLock: CloudLockAPI())
    }
    
    // MARK: - Test
    
    func testSaveCredentialsShouldAskAPIToSaveCredentials() {
        let spy = CloudLockAPISpy()
        sut.cloudLock = spy
        
        sut.save(type: Doors.self, items: []) { _ in }

        XCTAssertNotNil(spy.saveCredentialsCalled, "fetchItems should ask api to fetchItems")
    }
    
    func testSaveCredentialsShouldReceiveErrorWhenAPIFails() {
        let fake = CloudLockAPIFake()
        fake.success = false
        sut.cloudLock = fake
        var error: CloudLockError?

        let completed = expectation(description: "waiting block completion")
        sut.save(type: Doors.self, items: []) { result in
            error = result.error
            completed.fulfill()
        }

        let expected: CloudLockError? = .cannotSaveCredentials
        waitForExpectations(timeout: 2.0, handler: nil)
        XCTAssertEqual(error, expected, "saveCredentials worker should reiceve cannotSaveCredentials error when api fails")
    }
}
