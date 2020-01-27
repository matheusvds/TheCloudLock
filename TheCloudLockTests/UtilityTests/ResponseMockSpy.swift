//
//  ResponseMockSpy.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

struct ResponseMockSpy: ResponsesMock {
    
    static var fetchSuccessCalled = false
    static var fetchErrorCalled = false
    static var unlockErrorCalled = false
    static var unlockSuccessCalled = false
    static var unlockPermissionErrorCalled = false
    static var fetchItemsUsersSuccessCalled = false
    static var fetchItemsRemoveUsersSuccessCalled = false
    static var fetchUserCredentialsSuccessCalled = false
    static var fetchUserCredentialsErrorCalled = false
    static var fetchUserCredentialsEmptyCalled = false
    static var fetchItemsDoorsSuccessCalled = false
    static var fetchItemsRemoveDoorsSuccessCalled = false
    static var fetchDoorsCredentialsSuccessCalled = false
    static var fetchDoorsCredentialsErrorCalled = false
    static var fetchDoorsCredentialsEmptyCalled = false
    static var saveUserCredentialsSuccessCalled = false
    static var saveUserCredentialsErrorCalled = false
    static var saveDoorCredentialsSuccessCalled = false
    static var saveDoorCredentialsErrorCalled = false
    static var fetchItemsErrorCalled = false
    static var fetchItemsEmptyStateCalled = false
    
    static func fetchSuccess() {
        fetchSuccessCalled = true
    }
    
    static func fetchError() {
        fetchErrorCalled = true
    }
    
    static func unlockSuccess() {
        unlockSuccessCalled = true
    }
    
    static func unlockError() {
        unlockErrorCalled = true
    }
    
    static func unlockPermissionError() {
        unlockPermissionErrorCalled = true
    }
    
    static func fetchItemsUsersSuccess() {
        fetchItemsUsersSuccessCalled = true
    }

    static func fetchItemsRemoveUsersSuccess() {
        fetchItemsRemoveUsersSuccessCalled = true
    }
    
    static func fetchUserCredentialsSuccess() {
        fetchUserCredentialsSuccessCalled = true
    }
    
    static func fetchUserCredentialsError() {
        fetchUserCredentialsErrorCalled = true
    }
    
    static func fetchUserCredentialsEmpty() {
        fetchUserCredentialsEmptyCalled = true
    }
    
    static func fetchItemsDoorsSuccess() {
        fetchItemsDoorsSuccessCalled = true
    }

    static func fetchItemsRemoveDoorsSuccess() {
        fetchItemsRemoveDoorsSuccessCalled = true
    }
    
    static func fetchDoorsCredentialsSuccess() {
        fetchDoorsCredentialsSuccessCalled = true
    }
    
    static func fetchDoorsCredentialsError() {
        fetchDoorsCredentialsErrorCalled = true
    }
    
    static func fetchDoorsCredentialsEmpty() {
        fetchDoorsCredentialsEmptyCalled = true
    }
    
    static func saveUserCredentialsSuccess() {
        saveUserCredentialsSuccessCalled = true
    }
    
    static func saveUserCredentialsError() {
        saveUserCredentialsErrorCalled = true
    }
    
    static func saveDoorCredentialsSuccess() {
        saveDoorCredentialsSuccessCalled = true
    }
    
    static func saveDoorCredentialsError() {
        saveDoorCredentialsErrorCalled = true
    }
    
    static func fetchItemsError() {
        fetchItemsErrorCalled = true
    }
    
    static func fetchItemsEmptyState() {
        fetchItemsEmptyStateCalled = true
    }
    
}
