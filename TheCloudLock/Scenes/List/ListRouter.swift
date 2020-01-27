//
//  ListRouter.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 24/01/20.
//  Copyright (c) 2020 AppCompany. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListRoutingLogic {
    func routeToDetails<T: Item>(type: T.Type)
}

protocol ListDataPassing {
    var dataStore: ListDataStore? { get }
}

class ListRouter<T: Item>: NSObject, ListRoutingLogic, ListDataPassing {

    weak var viewController: ListController<T>?
    var dataStore: ListDataStore?
    
    // MARK: Routing
    
    func routeToDetails<T: Item>(type: T.Type) {
        let detailsController = DetailController<T>()
        var detailsDataStore = detailsController.router?.dataStore
        
        detailsDataStore?.credential = dataStore?.credential
        
        navigateToDetail(destination: detailsController)
    }
    
    // MARK: Navigation
    
    func navigateToDetail<T: Item>(destination: DetailController<T>) {
        let nav = BaseNavigationController(rootViewController: destination)
        viewController?.present(nav, animated: true, completion: nil)
    }
    
}