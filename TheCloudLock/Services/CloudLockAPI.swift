//
//  CloudLockAPI.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 22/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

class CloudLockAPI: CloudLockProtocol {
    
    var server: Server
    
    init(server: Server = FakeServer()) {
        self.server = server
    }
    
    static var fetchItemsJSON: String?
    static var fetchItemsCredentialsJSON: String?
    static var saveItemsCredentialsJSON: String?
    static var saveUserCredentialsJSON: String? = Responses.saveUserCrendentialsResponse
    static var saveDoorCredentialsJSON: String? = Responses.saveDoorCrendentialsResponse
    static var fetchUserCredentialsJSON: String? = Responses.fetchUserCredentialsResponse
    static var fetchDoorCredentialsJSON: String? = Responses.fetchDoorCredentialsResponse
    static var fetchUsersJSON: String? = Responses.fetchUsersResponse
    static var fetchDoorsJSON: String? = Responses.fetchDoorsResponse
    static var unlockDoorJSON: String? = Responses.unlockDoorResponse(code: 200)
    
    func fetchItems<T: Codable>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) {
        FakeServer.json = CloudLockAPI.fetchItemsJSON
        getData(type: type, error: .cannotFetchItems, completion: completion)
    }
    
    func fetchItemCredentials<T: Codable>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) {
        FakeServer.json = CloudLockAPI.fetchItemsCredentialsJSON
        getData(type: type, error: .cannotFetchCredentials, completion: completion)
    }
    
    func saveCredentials<T: Codable>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void) {
        FakeServer.json = CloudLockAPI.saveItemsCredentialsJSON
        getData(type: type, error: .cannotSaveCredentials, completion: completion)
    }
    
    func fetchDoors(completion: @escaping FetchDoorsCompletionHandler) {
        FakeServer.json = CloudLockAPI.fetchDoorsJSON
        getData(type: [Doors].self, error: .cannotFetch, completion: completion)
    }
    
    func unlockDoor(with doorID: String, completion: @escaping UnlockDoorCompletionHandler) {
        FakeServer.json = CloudLockAPI.unlockDoorJSON
        getData(type: Status.self, error: .cannotUnlock, completion: completion)
    }
    
    func getData<T: Codable>(type: T.Type, error: CloudLockError, completion: @escaping (CloudLockResult<T>) -> Void) {
        server.getData { data in
            guard let data = data else {
                completion(.failure(error: error))
                return
            }
            
            guard let decodedObject = try? JSONDecoder().decode(type, from: data) else {
                completion(.failure(error: error))
                return
            }
            
            completion(.success(result: decodedObject))
        }
    }
}
