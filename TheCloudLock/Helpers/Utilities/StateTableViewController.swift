//
//  FakeServerTableViewController.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

class StateTableViewController: UITableViewController {
    
    let sections = [
        "fetchDoors",
        "unlockDoor"
    ]
    
    let options = [
        
        ["Fetch Success", "Fetch Error"],
        ["Unlock Success", "Unlock Error", "Unlock Permission Error"]
        
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
        
        cell.textLabel?.text = options[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch options[indexPath.section][indexPath.row] {
        case "Fetch Success":
            fetchSuccess()
        case "Fetch Error":
            fetchError()
        case "Unlock Success":
            unlockSuccess()
        case "Unlock Error":
            unlockError()
        case "Unlock Permission Error":
            unlockPermissionError()
        default: ()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func fetchSuccess() {
        CloudLockAPI.fetchDoorsResponse = .success(result: [
            Door(doorID: 0, name: "Living Room", image: "livingroom"),
            Door(doorID: 1, name: "Great Hallway", image: "hallway"),
            Door(doorID: 2, name: "The Office", image: "office")
            ].shuffled()
        )
    }
    
    func fetchError() {
        CloudLockAPI.fetchDoorsResponse = .failure(error: .cannotFetch)
    }
    
    func unlockSuccess() {
        CloudLockAPI.unlockDoorResponse = .success(result:
            Status(code: 200)
        )
    }
    
    func unlockError() {
        CloudLockAPI.unlockDoorResponse = .success(result:
            Status(code: 400)
        )
    }
    
    func unlockPermissionError() {
        CloudLockAPI.unlockDoorResponse = .success(result:
            Status(code: 204)
        )
    }
    
}
