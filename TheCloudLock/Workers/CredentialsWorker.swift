//
//  CredentialsWorker.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 26/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

class CredentialsWorker {

    let cloudLockAPI: CloudLockProtocol

    init(cloudLockAPI: CloudLockProtocol) {
        self.cloudLockAPI = cloudLockAPI
    }
    
    // MARK: - Fetch Item Credentials

    func fetchItemCredentials<T: Item, U: Codable>(id: String, name: String, type: T.Type, completion: @escaping (CloudLockResult<U>) -> Void) {
        FakeServer.setServer(type: type)
        cloudLockAPI.fetchItemCredentials(type: U.self) { result in
            switch result {
            case .success(let data):
                completion(.success(result: data))
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }

}
