//
//  CloudLockAPIFake.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

class CloudLockAPIFake: CloudLockProtocol {
    
    var success = true
    var statusCode = 200
    
    func fetchDoors(completion: @escaping FetchDoorsCompletionHandler) {
        if success {
            completion(.success(result: []))
            return
        }
        completion(.failure(error: .cannotFetch))
    }
    
    func unlockDoor(with doorID: String, completion: @escaping UnlockDoorCompletionHandler) {
        if success {
            completion(.success(result: Status(code: statusCode)))
            return
        }
        completion(.failure(error: .cannotUnlock))
    }
    
    func fetchItems<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {
        if !success {
            completion(.failure(error: .cannotFetchItems))
        }
    }
    
    func fetchItemCredentials<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable { }
    
    func saveCredentials<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {
        if !success {
            completion(.failure(error: .cannotSaveCredentials))
        }
    }
}
