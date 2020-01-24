//
//  UnlockWorkerTests.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 21/01/20.
//  Copyright (c) 2020 AppCompany. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TheCloudLock
import XCTest

class UnlockWorkerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: UnlockWorker!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupUnlockWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupUnlockWorker() {
        sut = UnlockWorker(cloudLock: CloudLockAPIFake())
    }
    
    // MARK: Test doubles
    
    class CloudLockAPIFake: CloudLockProtocol {
        
        var success = true
        func fetchDoors(completion: @escaping FetchDoorsCompletionHandler) {
            if success {
                completion(.success(result: []))
                return
            }
            completion(.failure(error: .cannotFetch))
        }
        
        func unlockDoor(with doorID: Int, completion: @escaping UnlockDoorCompletionHandler) {
            
        }
    }
    
    class CloudLockAPISpy: CloudLockProtocol {
        
        let doors = [Seeds.Doors.hallway]
        var fetchDoorsCalled = false
        
        func fetchDoors(completion: @escaping FetchDoorsCompletionHandler) {
            fetchDoorsCalled = true
            completion(.success(result: doors))
        }
        
        func unlockDoor(with doorID: Int, completion: @escaping UnlockDoorCompletionHandler) {
            
        }
    }
    
    // MARK: Tests
        
    func testFetchDoorsShouldCallCloudLockFetchDoors() {
        let spy = CloudLockAPISpy()
        sut.cloudLock = spy

        sut.fetchDoors { _ in }
        
        XCTAssertTrue(spy.fetchDoorsCalled, "fetchDoors should call CloudLockProtocol fetchDoors")
    }
    
    func testFetchDoorsShouldGetFetchedDoorsFromCloudLockProtocol() {
        let spy = CloudLockAPISpy()
        sut.cloudLock = spy
        
        var fetchedDoors: [Door]?
        
        let completed = expectation(description: "waiting block to complete")
        sut.fetchDoors { result in
            fetchedDoors = result.data
            completed.fulfill()
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
        XCTAssertNotNil(fetchedDoors, "fetchDoors should have fetched doors passed to worker")
    }
    
    func testFetchDoorsShouldGetErrorWhenCloudLockProtocolGetsError() {
        let fake = CloudLockAPIFake()
        fake.success = false
        sut.cloudLock = fake
        
        var fetchError: CloudLockError?
        
        let completed = expectation(description: "waiting block to complete")
        sut.fetchDoors { result in
            fetchError = result.error
            completed.fulfill()
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
        
        guard let error = fetchError else {
            XCTFail("fetchDoors should have fetched error passed to worker")
            return
        }
        
        XCTAssertEqual(error, .cannotFetch, "fetchDoors should have fetched error passed to worker")
    }
}