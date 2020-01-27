//
//  File.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

class CloudLockAPITests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: CloudLockAPI!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupCloudLockAPI()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupCloudLockAPI() {
        sut = CloudLockAPI()
    }
    
    // MARK: - Test Doubles
    
    class ServerFake: Server {
        var data: Data?
        func getData(completion: @escaping (Data?) -> Void) {
            completion(data)
        }
    }
    
    class ServerSpy: Server {
        
        var getDataCalled = false
        
        func getData(completion: @escaping (Data?) -> Void) {
            getDataCalled = true
            completion(nil)
        }
    }
    
    class DummyModel: Codable {
        let fakePropName: String
    }
    
    // MARK: - Tests
    
    func testFetchItemsShouldAskServerToGetData() {
        let spy = ServerSpy()
        sut.server = spy
        
        sut.fetchItems(type: Doors.self) { _ in }
        
        XCTAssert(spy.getDataCalled, "fetch items should ask server to get data")
    }
    
    func testFetchCredentialsShouldAskServerToGetData() {
        let spy = ServerSpy()
        sut.server = spy
        
        sut.fetchItemCredentials(type: Doors.self) { _ in }
        
        XCTAssert(spy.getDataCalled, "fetch credentials should ask server to get data")
    }
    
    func testSaveCredentialsShouldAskServerToGetData() {
        let spy = ServerSpy()
        sut.server = spy
        
        sut.saveCredentials(type: Doors.self) { _ in }
        
        XCTAssert(spy.getDataCalled, "save credentials should ask server to get data")
    }
    
    func testFetchDoorsShouldAskServerToGetData() {
        let spy = ServerSpy()
        sut.server = spy
        
        sut.fetchDoors { _ in }
        
        XCTAssert(spy.getDataCalled, "fetch Doors should ask server to get data")
    }
    
    func testUnlockDoorsShouldAskServerToGetData() {
        let spy = ServerSpy()
        sut.server = spy
        
        sut.unlockDoor(with: "") { _ in }
        
        XCTAssert(spy.getDataCalled, "unlock Door should ask server to get data")
    }
    
    func testFetchItemShouldOutputSameTypeFetchedData() {
        let data = Seeds.Response.fetchItemResponse.data(using: .utf8)
        let fake = ServerFake()
        fake.data = data
        sut.server = fake
        
        var fetchData: [Doors]?
        let completed = expectation(description: "waiting block to complete")
        sut.fetchItems(type: [Doors].self) { result in
            fetchData = result.data
            completed.fulfill()
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
        let expected: [Doors]? = [
            Doors(id: "0", name: "Living Room", image: "livingroom")
        ]
        
        XCTAssertEqual(fetchData, expected, "fetchItems should have expected data")
    }
    
    func testFetchItemWithTypeDontConformItemShouldOutputError() {
        let data = Seeds.Response.fetchItemResponse.data(using: .utf8)
         let fake = ServerFake()
         fake.data = data
         sut.server = fake
         
         var error: CloudLockError?
         let completed = expectation(description: "waiting block to complete")
         sut.fetchItems(type: DummyModel.self) { result in
            error = result.error
            completed.fulfill()
         }
         
         waitForExpectations(timeout: 2.0, handler: nil)
        let expected: CloudLockError? = .cannotFetchItems
         XCTAssertEqual(error, expected, "fetchItems should have expected data")
    }
}

extension Doors: Equatable {
    public static func == (lhs: Doors, rhs: Doors) -> Bool {
        return
                lhs.id == rhs.id &&
                lhs.name == rhs.name &&
                lhs.image == rhs.image
    }
}
