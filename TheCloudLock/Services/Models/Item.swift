//
//  Item.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 25/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

protocol Item: Codable, Namable {
    var id: String { get }
    var name: String { get }
}

protocol Namable {
    static var entityName: String { get }
}

extension Namable {
    static var entityName: String {
        return String(describing: Self.self)
    }
}
