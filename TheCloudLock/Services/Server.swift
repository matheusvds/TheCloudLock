//
//  FakeServer.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

/// Defines a server to provide data
protocol Server {
    
    /// Gets and parses data from FakeServer.json static variable
    /// - Parameter completion: Callback containg the function's result
    func getData(completion: @escaping (Data?) -> Void)
}

class FakeServer: Server {
    static var json: String?
    
    func getData(completion: @escaping (Data?) -> Void) {
        
        guard let json = FakeServer.json else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                debugPrint("## SERVER ##: json is nil")
                completion(nil)
            }
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            debugPrint("## SERVER ##: JSON \(FakeServer.json ?? "is nil")")
            completion(json.data(using: .utf8))
        }
    }
    
    /// Sets the correct response kind according to the model's type
    /// - Parameter type: Generic type used to set the response
    static func setServer<T: Item>(type: T.Type) {
        // MARK: - Fetch
        
        switch type.entityName.lowercased() {
        case let name where name.contains("door"):
            CloudLockAPI.fetchItemsJSON = CloudLockAPI.fetchDoorsJSON
            CloudLockAPI.fetchItemsCredentialsJSON = CloudLockAPI.fetchDoorCredentialsJSON
            CloudLockAPI.saveItemsCredentialsJSON = CloudLockAPI.saveDoorCredentialsJSON
        case let name where name.contains("user"):
            CloudLockAPI.fetchItemsJSON = CloudLockAPI.fetchUsersJSON
            CloudLockAPI.fetchItemsCredentialsJSON = CloudLockAPI.fetchUserCredentialsJSON
            CloudLockAPI.saveItemsCredentialsJSON = CloudLockAPI.saveUserCredentialsJSON
        default:
            FakeServer.json = nil
        }
    }
}
