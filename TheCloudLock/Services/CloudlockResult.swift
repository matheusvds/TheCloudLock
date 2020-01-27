//
//  CloudlockResult.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

// MARK: - Operation results

typealias SaveCredentialsCompletionHandler = (CloudLockResult<Status>) -> Void
typealias FetchDoorsCompletionHandler = (CloudLockResult<[Doors]>) -> Void
typealias UnlockDoorCompletionHandler = (CloudLockResult<Status>) -> Void

enum CloudLockResult<U> {
    case success(result: U)
    case failure(error: CloudLockError)
}

// MARK: - Operation errors

enum CloudLockError: Error {
    
    case cannotSaveCredentials
    case cannotFetchCredentials
    case cannotFetchItems
    
    case cannotFetch
    case cannotUnlock
    case permissionDenied
}
