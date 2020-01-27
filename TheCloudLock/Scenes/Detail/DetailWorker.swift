//
//  StatusWorker.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 26/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

class DetailWorker {
    
    var cloudLock: CloudLockProtocol
    
    init(cloudLock: CloudLockProtocol) {
        self.cloudLock = cloudLock
    }
    
    func save<T: Item>(type: T.Type, items: [CredentialItem], completion: @escaping (CloudLockResult<Status>) -> Void) {
        FakeServer.setServer(type: type)
        cloudLock.saveCredentials(type: Status.self) { result in
            switch result {
            case .success(let data):
                if data.code != 200 {
                    completion(.failure(error: .cannotSaveCredentials))
                    return
                }
                
                completion(.success(result: data))
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }
}
