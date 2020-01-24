//
//  CloudLockResult+.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock

extension CloudLockResult where U == [Door] {
    var data: [Door]? {
        switch self {
        case .success(let data):
            return data
        default:
            return nil
        }
    }
    
    var error: CloudLockError? {
        switch self {
        case .failure(let error):
            return error
        default:
            return nil
        }
    }
}
