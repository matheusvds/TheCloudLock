//
//  DetailInteractor.swift
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

protocol DetailBusinessLogic {
    func fetchCredentials(request: Detail.FetchItemCredentials.Request)
    func saveCredentials<T: Item>(type: T.Type, request: Detail.SaveCredentials.Request)

}

protocol DetailDataStore {
    var credential: Credential? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var credential: Credential?
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker? = DetailWorker(cloudLock: CloudLockAPI())
    
    // MARK: - Fetch Credentials
    
    func fetchCredentials(request: Detail.FetchItemCredentials.Request) {

        let response = Detail.FetchItemCredentials.Response(credential: credential, error: nil)
        presenter?.presentCredentials(response: response)
    }
    
    // MARK: - Save Credentials
    
    func saveCredentials<T: Item>(type: T.Type, request: Detail.SaveCredentials.Request) {
        worker?.save(type: type, items: request.items, completion: { result in
            switch result {
            case .success:
                let response = Detail.SaveCredentials.Response()
                self.presenter?.presentSaveCredentials(response: response)
            case .failure(let error):
                let response = Detail.SaveCredentials.Response(error: error)
                self.presenter?.presentSaveCredentials(response: response)
            }
        })
    }
    
}
