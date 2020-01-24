//
//  Identifiable.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 22/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

protocol Identifiable: class {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
