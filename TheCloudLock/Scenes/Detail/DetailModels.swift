//
//  DetailModels.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 26/01/20.
//  Copyright (c) 2020 AppCompany. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Detail {
    // MARK: Use cases
    
    enum FetchItemCredentials {
        struct Request { }
        struct Response {
            let credential: Credential?
            var error: CloudLockError?
        }
        struct ViewModel {
            var title: String
            var items: [DisplayedItem]
            let resultMessage: String
            
            struct DisplayedItem {
                var name: String
                var active: Bool
            }
        }
    }
    
    enum SaveCredentials {
        struct Request {
            var items: [CredentialItem]
        }
        struct Response {
            var error: CloudLockError?
        }
        struct ViewModel {
            let resultMessage: String
        }
    }
}

typealias DisplayedCredentialItem = Detail.FetchItemCredentials.ViewModel.DisplayedItem