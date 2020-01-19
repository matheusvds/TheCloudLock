//
//  ViewCode.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 18/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

protocol ViewCode {
    func setup()
    func setupHierarchy()
    func buildConstraints()
    func addAdditionalConfiguration()
}

extension ViewCode {
    func setup() {
        setupHierarchy()
        buildConstraints()
        addAdditionalConfiguration()
    }
}
