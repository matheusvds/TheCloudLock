//
//  File.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

class CloudLockAPISpy: CloudLockProtocol {
    
    let doors = [Seeds.Door.hallway]
    var fetchDoorsCalled = false
    var fetchItemsCalled = false
    var unlockDoorCalled = false
    var fetchItemCredentialsCalled = false
    var saveCredentialsCalled = false
    
    func fetchItems<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {
        fetchItemsCalled = true
        completion(.failure(error: .cannotFetch))
    }
    
    func fetchDoors(completion: @escaping FetchDoorsCompletionHandler) {
        fetchDoorsCalled = true
        completion(.success(result: doors))
    }
    
    func unlockDoor(with doorID: String, completion: @escaping UnlockDoorCompletionHandler) {
        unlockDoorCalled = true
        completion(.success(result: Status(code: 200)))
    }
    
    func fetchItemCredentials<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {
        fetchItemCredentialsCalled = true
        completion(.failure(error: .cannotFetchCredentials))
    }
    
    func saveCredentials<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {
        saveCredentialsCalled = true
        completion(.failure(error: .cannotSaveCredentials))
    }
}
