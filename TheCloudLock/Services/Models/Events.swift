//
//  Event.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

struct Events: Item {
    var id: String
    var name: String
    var detail: String?
}

extension Events {
        
    static var selectable: Bool {
        return false
    }
    
    static var editable: Bool {
        return false
    }
    
    static var cellType: AnyClass {
        return ListEventViewCell.self
    }
    
    static var large: Bool {
        return false
    }
}
