//
//  CloudLockAPI.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 22/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

class CloudLockAPI: CloudLockProtocol {
    func fetchDoors(completion: @escaping FetchDoorsCompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            completion(.success(result: [
//                Door(doorID: 0, name: "Living Room", image: "livingroom")
//            ]))
            completion(.failure(error: .cannotFetch))
            
        }
    }
    
    func unlockDoor(with doorID: Int, completion: @escaping UnlockDoorCompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(result: Status(code: 204)))
        }
    }
}

