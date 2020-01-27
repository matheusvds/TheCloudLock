//
//  FakeServerTableViewController.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

enum State: String {
    case fetchSuccess = "Fetch Success"
    case fetchError = "Fetch Error"
    case unlockSuccess = "Unlock Success"
    case unlockError = "Unlock Error"
    case unlockPermissionError = "Unlock Permission Error"
    case listError = "List Error"
    case listEmpty = "List Empty"
    case listDoorsSuccess = "List Doors Success"
    case removeDoorSuccess = "Remove Door Success"
    case listUsersSuccess = "List Users Success"
    case removeUserSuccess = "Remove User Success"
    case fetchUserCredetialsSuccess = "Fetch User Credentials Success"
    case fetchUserCredentalsError = "Fetch User Credentials Error"
    case fetchUserCredentialsEmpty = "Fetch User Credentials Empty"
    case fetchDoorCredetialsSuccess = "Fetch Door Credentials Success"
    case fetchDoorCredentalsError = "Fetch Door Credentials Error"
    case fetchDoorCredentialsEmpty = "Fetch Door Credentials Empty"
    case saveUserCredentialsSuccess = "Save User Credentials Success"
    case saveUserCredentialsError = "Save User Credentials Error"
    case saveDoorCredentialsSuccess = "Save Door Credentials Success"
    case saveDoorCredentialsError = "Save Door Credentials Error"
}

class StateTableViewController: UITableViewController {
    
    var response: ResponsesMock.Type
    
    init(response: ResponsesMock.Type = Responses.self) {
        self.response = response
        super.init(nibName: nil, bundle: nil)
        response.fetchSuccess()
        response.unlockSuccess()
        response.fetchItemsUsersSuccess()
        response.fetchItemsDoorsSuccess()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storyboards used")
    }
    
    let sections =
        [
            "fetchDoors",
            "unlockDoor",
            "List (common states)",
            "Doors",
            "Users",
            "Save Credentials"
    ]
    
    let options: [[State]] = [
        
        [
            .fetchSuccess,
            .fetchError
        ],
        
        [
            .unlockSuccess,
            .unlockError,
            .unlockPermissionError
        ],
        
        [
            .listError,
            .listEmpty
        ],
        
        [
            .listDoorsSuccess,
            .removeDoorSuccess,
            .fetchDoorCredetialsSuccess,
            .fetchDoorCredentalsError,
            .fetchDoorCredentialsEmpty
        ],
        
        [
            .listUsersSuccess,
            .removeUserSuccess,
            .fetchUserCredetialsSuccess,
            .fetchUserCredentalsError,
            .fetchUserCredentialsEmpty
        ],
        [
            .saveUserCredentialsSuccess,
            .saveUserCredentialsError,
            .saveDoorCredentialsSuccess,
            .saveDoorCredentialsError
        ]
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = options[indexPath.section][indexPath.row].rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch options[indexPath.section][indexPath.row] {
            
            // MARK: - Fetch
            
        case .fetchSuccess:
            response.fetchSuccess()
        case .fetchError:
            response.fetchError()
            
            // MARK: - Unlock
            
        case .unlockSuccess:
            response.unlockSuccess()
        case .unlockError:
            response.unlockError()
        case .unlockPermissionError:
            response.unlockPermissionError()
            
            // MARK: - Doors
            
        case .listDoorsSuccess:
            response.fetchItemsDoorsSuccess()
        
        case .removeDoorSuccess:
            response.fetchItemsRemoveDoorsSuccess()
            
            // MARK: - Users
            
        case .listUsersSuccess:
            response.fetchItemsUsersSuccess()
        
        case .removeUserSuccess:
            response.fetchItemsRemoveUsersSuccess()
            
            // MARK: - List
            
        case .listError:
            response.fetchItemsError()
            
        case .listEmpty:
            response.fetchItemsEmptyState()
            
        case .fetchUserCredetialsSuccess:
            response.fetchUserCredentialsSuccess()
            
        case .fetchUserCredentalsError:
            response.fetchUserCredentialsError()

        case .fetchUserCredentialsEmpty:
            response.fetchUserCredentialsEmpty()
            
        case .fetchDoorCredetialsSuccess:
            response.fetchDoorsCredentialsSuccess()
            
        case .fetchDoorCredentalsError:
            response.fetchDoorsCredentialsError()
            
        case .fetchDoorCredentialsEmpty:
            response.fetchDoorsCredentialsEmpty()
            
        case .saveUserCredentialsSuccess:
            response.saveUserCredentialsSuccess()
            
        case .saveUserCredentialsError:
            response.saveUserCredentialsError()
            
        case .saveDoorCredentialsSuccess:
            response.saveDoorCredentialsSuccess()
            
        case .saveDoorCredentialsError:
            response.saveDoorCredentialsError()
        }
        
        dismiss(animated: true, completion: nil)
    }
}
