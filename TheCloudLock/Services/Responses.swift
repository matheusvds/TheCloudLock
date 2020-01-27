//
//  Responses.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 25/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

protocol ResponsesMock {
    
    static func fetchSuccess()
    
    static func fetchError()

    static func unlockSuccess()

    static func unlockError()

    static func unlockPermissionError()

    static func fetchItemsUsersSuccess()

    static func fetchItemsRemoveUsersSuccess()

    static func fetchUserCredentialsSuccess()

    static func fetchUserCredentialsError()

    static func fetchUserCredentialsEmpty()

    static func fetchItemsDoorsSuccess()

    static func fetchItemsRemoveDoorsSuccess()

    static func fetchDoorsCredentialsSuccess()

    static func fetchDoorsCredentialsError()

    static func fetchDoorsCredentialsEmpty()

    static func saveUserCredentialsSuccess()

    static func saveUserCredentialsError()

    static func saveDoorCredentialsSuccess()

    static func saveDoorCredentialsError()

    static func fetchItemsError()

    static func fetchItemsEmptyState()
}

struct Responses: ResponsesMock {
    
    // MARK: - "API"
    
    // MARK: - Unlock Scene
    static func fetchSuccess() {
        CloudLockAPI.fetchDoorsJSON = Responses.fetchDoorsResponse
    }
    
    static func fetchError() {
        CloudLockAPI.fetchDoorsJSON = nil
    }
    
    static func unlockSuccess() {
        CloudLockAPI.unlockDoorJSON = Responses.unlockDoorResponse(code: 200)
    }
    
    static func unlockError() {
        CloudLockAPI.unlockDoorJSON = Responses.unlockDoorResponse(code: 400)
    }
    
    static func unlockPermissionError() {
        CloudLockAPI.unlockDoorJSON = Responses.unlockDoorResponse(code: 204)
    }
    
    // MARK: - List Scene
    
        // MARK: - Users
    
    static func fetchItemsUsersSuccess() {
        CloudLockAPI.fetchUsersJSON = Responses.fetchUsersResponse
    }
    
    static func fetchItemsAddUsersSuccess() {
        CloudLockAPI.fetchUsersJSON = Responses.fetchUsersAddResponse
    }
    
    static func fetchItemsRemoveUsersSuccess() {
        CloudLockAPI.fetchUsersJSON = Responses.fetchUsersDeleteResponse
    }
    
    static func fetchUserCredentialsSuccess() {
        CloudLockAPI.fetchUserCredentialsJSON = Responses.fetchUserCredentialsResponse
    }
    
    static func fetchUserCredentialsError() {
        CloudLockAPI.fetchUserCredentialsJSON = nil
    }
    
    static func fetchUserCredentialsEmpty() {
        CloudLockAPI.fetchUserCredentialsJSON = Responses.fetchUserCredentialsEmptyResponse
    }
    
        // MARK: - Doors
    
    static func fetchItemsDoorsSuccess() {
        CloudLockAPI.fetchDoorsJSON = Responses.fetchDoorsResponse
    }
    
    static func fetchItemsAddDoorsSuccess() {
        CloudLockAPI.fetchDoorsJSON = Responses.fetchDoorsAddResponse
    }
    
    static func fetchItemsRemoveDoorsSuccess() {
        CloudLockAPI.fetchDoorsJSON = Responses.fetchDoorsDeleteResponse
    }
    
    static func fetchDoorsCredentialsSuccess() {
        CloudLockAPI.fetchDoorCredentialsJSON = Responses.fetchDoorCredentialsResponse
    }
    
    static func fetchDoorsCredentialsError() {
        CloudLockAPI.fetchDoorCredentialsJSON = nil
    }
    
    static func fetchDoorsCredentialsEmpty() {
        CloudLockAPI.fetchDoorCredentialsJSON = Responses.fetchDoorCredentialsEmptyResponse
    }
    
    // MARK: - Detail Scene
    
    static func saveUserCredentialsSuccess() {
        CloudLockAPI.saveUserCredentialsJSON = Responses.saveUserCrendentialsResponse
    }
    
    static func saveUserCredentialsError() {
        CloudLockAPI.saveUserCredentialsJSON = Responses.saveUserCredentialsResponseError
    }
    
    static func saveDoorCredentialsSuccess() {
        CloudLockAPI.saveUserCredentialsJSON = Responses.saveDoorCrendentialsResponse
    }
    
    static func saveDoorCredentialsError() {
        CloudLockAPI.saveUserCredentialsJSON = Responses.saveDoorCredentialsResponseError
    }

    // MARK: - Error and Empty States
    static func fetchItemsError() {
        CloudLockAPI.fetchUsersJSON = .none
        CloudLockAPI.fetchDoorsJSON = .none
    }
    
    static func fetchItemsEmptyState() {
        CloudLockAPI.fetchUsersJSON = Responses.emptyListResponse
        CloudLockAPI.fetchDoorsJSON = Responses.emptyListResponse
    }
    
    // MARK: - Status
    
    static func statusResponse(code: Int) -> String {
        return  """
        {
        "code": \(code)
        }
        """
    }
    
    // MARK: - Empty List
    
    static let emptyListResponse = " [] "
    
    // MARK: - Fetch Doors
    
    static let fetchDoorsResponse =
    """
    [
       {
          "id":"0",
          "name":"Living Room",
          "image":"livingroom"
       },
       {
          "id":"1",
          "name":"Great Hallway",
          "image":"hallway"
       },
       {
          "id":"2",
          "name":"The Office",
          "image":"office"
       }
    ]
    """
    
    // MARK: - Unlock Door
    
    static func unlockDoorResponse(code: Int) -> String {
        return statusResponse(code: code)
    }
    
    static func removeItemResponse(code: Int) -> String {
        return statusResponse(code: code)
    }
    
    // MARK: - Delete Door
    
    static let fetchDoorsDeleteResponse =
    """
    [
       {
          "id":"0",
          "name":"Living Room",
          "image":"livingroom"
       },
       {
          "id":"1",
          "name":"Great Hallway",
          "image":"hallway"
       }
    ]
    """
    
    // MARK: - Add Door
    
    static let fetchDoorsAddResponse =
    """
    [
       {
          "id":"0",
          "name":"Living Room",
          "image":"livingroom"
       },
       {
          "id":"1",
          "name":"Great Hallway",
          "image":"hallway"
       },
       {
          "id":"2",
          "name":"The Office",
          "image":"office"
       },
       {
          "id":"3",
          "name":"Second Floor",
          "image":"secfloor"
       }
    ]
    """
    
    // MARK: - Fetch Users
    
    static let fetchUsersResponse =
    """
    [
       {
          "id":"0",
          "name":"Sam"
       },
       {
          "id":"1",
          "name": "Suzzy"
       },
       {
          "id":"2",
          "name":"Mr. Happy"
       }
    ]
    """
    
    // MARK: - Delete User
    
    static let fetchUsersDeleteResponse =
    """
    [
       {
          "id":"0",
          "name":"Sam"
       },
       {
          "id":"1",
          "name": "Suzzy"
       }
    ]
    """
    
    // MARK: - Add User
    
    static let fetchUsersAddResponse =
    """
    [
       {
          "id":"0",
          "name":"Sam"
       },
       {
          "id":"1",
          "name": "Suzzy"
       },
       {
          "id":"2",
          "name":"Mr. Happy"
       },
       {
          "id":"3",
          "name":"Mr. Bob"
       }
    ]
    """
    
    // MARK: - User Credentials
    static let fetchUserCredentialsResponse =
    """
        {
           "id":"0",
           "name":"Sam",
           "credentials":[
              {
                 "id":"0",
                 "name":"Living Room",
                 "active":true
              },
              {
                 "id":"1",
                 "name":"Great Hallway",
                 "active":true
              },
              {
                 "id":"2",
                 "name":"The Office",
                 "active":false
              },
              {
                 "id":"3",
                 "name":"Second Floor",
                 "active":false
              }
           ]
        }

    """
    
    static let fetchUserCredentialsEmptyResponse =
    """
        {
           "id":"0",
           "name":"Sam",
           "credentials":[]
        }

    """
    
    // MARK: - Door Credentials
    
    static let fetchDoorCredentialsResponse =
    """
        {
           "id":"0",
           "name":"Living Room",
           "credentials":[
              {
                 "id":"0",
                 "name":"Sam",
                 "active": true
              },
              {
                 "id":"1",
                 "name": "Suzzy",
                 "active": false
              },
              {
                 "id":"2",
                 "name":"Mr. Happy",
                 "active": false
              },
              {
                 "id":"3",
                 "name":"Mr. Bob",
                 "active": true
              }
           ]
        }
    """
    
    static let fetchDoorCredentialsEmptyResponse =
    """
        {
           "id":"0",
           "name":"Living Room",
           "credentials":[]
        }
    """
    
    // MARK: - Remove and Add Credentials
    
        // MARK: - Door Details
    static let saveDoorCrendentialsResponse = statusResponse(code: 200)
    static let saveDoorCredentialsResponseError = statusResponse(code: 204)
    
        // MARK: - User Details
    
    static let saveUserCrendentialsResponse = statusResponse(code: 200)
    static let saveUserCredentialsResponseError = statusResponse(code: 204)
    
}
