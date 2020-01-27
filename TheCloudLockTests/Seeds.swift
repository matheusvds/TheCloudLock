//
//  Seeds.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 21/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

struct Seeds {
    
    struct Door {
        static let hallway = Doors(id: "0", name: "Living Room", image: "livingroom")
    }
    
    struct Model {
        static let sam = DisplayedItem(id: "0", name: "Sam")
        static let happy = DisplayedItem(id: "2", name: "Mr. Happy")
        static let office = DisplayedItem(id: "1", name: "Office")
        static let hallway = DisplayedCredentialItem(name: "Hallway", active: false)
        static let room = DisplayedCredentialItem(name: "Room", active: true)
    }
}
