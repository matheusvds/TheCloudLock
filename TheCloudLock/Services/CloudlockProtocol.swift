//
//  CloudlockProtocol.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

// MARK: - Cloud Lock Protocol

protocol CloudLockProtocol {
    
    /// Fetches and parses items with specific type
    /// - Parameters:
    ///   - type: Generic paramater that defines the model to be parsed
    ///   - completion: Callback with the result
    func fetchItems<T: Codable>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void)
        
    /// Fetches credentials for item with specific type
    /// - Parameters:
    ///   - type: Generic parameter that defines the model to be parsed
    ///   - completion: Callback with the result
    func fetchItemCredentials<T: Codable>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void)
        
    /// Saves credentials for item with specific type
    /// - Parameters:
    ///   - type: Generic parameter that defines the model to be parsed
    ///   - completion: Callback with the result
    func saveCredentials<T: Codable>(type: T.Type, completion: @escaping (CloudLockResult<T>) -> Void)
    
    /// Fetches nearst doors
    /// - Parameter completion: Callback with the operation result
    func fetchDoors(completion: @escaping FetchDoorsCompletionHandler)
        
    /// Unlocks a door with a specific ID.
    /// - Parameters:
    ///   - doorID: Id from the door to be unlocked
    ///   - completion: Callback with the operation result
    func unlockDoor(with doorID: String, completion: @escaping UnlockDoorCompletionHandler)
}
