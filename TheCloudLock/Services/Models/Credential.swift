//
//  Credential.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 26/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Credential: Item {
    let id: String
    let name: String
    let credentials: [CredentialItem]
}

// MARK: - Credential
struct CredentialItem: Item {
    let id: String
    let name: String
    let active: Bool
}
