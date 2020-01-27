//
//  CloudLockAPIDummy.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

class CloudLockAPIDummy: CloudLockProtocol {
    func fetchItems<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {
        completion(.failure(error: .cannotFetchItems))
    }
    
    func fetchItemCredentials<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {
        completion(.failure(error: .cannotFetchCredentials))
    }
    
    func saveCredentials<T>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) where T: Decodable, T: Encodable {}
    
    func fetchDoors(completion: @escaping FetchDoorsCompletionHandler) {}
    
    func unlockDoor(with doorID: String, completion: @escaping UnlockDoorCompletionHandler) {}
}
