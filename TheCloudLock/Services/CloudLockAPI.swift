//
//  CloudLockAPI.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 22/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

class CloudLockAPI: CloudLockProtocol {
    
    static var fetchDoorsResponse: CloudLockResult<[Door]> = .failure(error: .cannotFetch)
    static var unlockDoorResponse: CloudLockResult<Status> = .success(result: Status(code: 204))

    func fetchDoors(completion: @escaping (CloudLockResult<[Door]>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(CloudLockAPI.fetchDoorsResponse)
        }
    }
    
    func unlockDoor(with doorID: Int, completion: @escaping UnlockDoorCompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(CloudLockAPI.unlockDoorResponse)
        }
    }
}

//
//struct FakeResponse {
//    static let fetchDoorsSuccessJSON: String =
//"""
//{
//    "doorID": 0,
//    "name": "Living Room",
//    "image": "livingroom"
//}
//"""
//    static let unlockDoorSuccessJSON: String =
//"""
//{
//    "code": 200
//}
//"""
//    static let unlockDoorAuthErrorJSON: String =
//"""
//{
//    "code": 204
//}
//"""
//}
//
//struct FakeServerData {
//    static var fetchDoorsSuccessResponse: Data {
//        return FakeResponse.fetchDoorsSuccessJSON.data(using: .utf8)!
//    }
//
//    static var fetchDoorsErrorResponse: Data {
//        return String().data(using: .utf8)!
//    }
//
//    static var unlockDoorSuccessResponse: Data {
//        return FakeResponse.unlockDoorSuccessJSON.data(using: .utf8)!
//    }
//
//    static var unlockhDoorErrorResponse: Data {
//        return String().data(using: .utf8)!
//    }
//
//    static var unlockDoorAuthErrorJSON: Data {
//        return FakeResponse.unlockDoorAuthErrorJSON.data(using: .utf8)!
//    }
//}
