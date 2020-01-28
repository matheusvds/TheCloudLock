//
//  Item.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 25/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

typealias Item = Codable & Itemable & Namable & Selectable & Editable & AssociatedCellType & LargePresentable & Detailable

// MARK: - Itemable

protocol Itemable {
    var id: String { get }
    var name: String { get }
}

// MARK: - Namable

protocol Namable {
    static var entityName: String { get }
}

extension Namable {
    static var entityName: String {
        return String(describing: Self.self)
    }
}

// MARK: - Selectable

protocol Selectable {
    static var selectable: Bool { get }
}

extension Selectable {
    static var selectable: Bool {
        return true
    }
}

// MARK: - Editable

protocol Editable {
    static var editable: Bool { get }
}

extension Editable {
    static var editable: Bool {
        return true
    }
}

// MARK: - AssociatedCellType

protocol AssociatedCellType {
    static var cellType: AnyClass { get }
}

extension AssociatedCellType {
    static var cellType: AnyClass {
        return ListTableViewCell.self
    }
}

// MARK: - LargePresentable

protocol LargePresentable {
    static var large: Bool { get }
}

extension LargePresentable {
    static var large: Bool {
        return true
    }
}

// MARK: - Detailable

protocol Detailable {
    var detail: String? { get }
}

extension Detailable {
    var detail: String? {
        return nil
    }
}
