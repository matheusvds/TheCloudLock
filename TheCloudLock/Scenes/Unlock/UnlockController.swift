//
//  UnlockViewController.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 18/01/20.
//  Copyright (c) 2020 AppCompany. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UnlockDisplayLogic: class {
    func displayFetchDoors(viewModel: Unlock.FetchDoors.ViewModel)
    func displayUnlockDoor(viewModel: Unlock.UnlockDoor.ViewModel)
}

class UnlockController: Controller {
    
    // MARK: VIP Cycle
    
    var interactor: UnlockBusinessLogic?
    var router: (NSObjectProtocol & UnlockRoutingLogic & UnlockDataPassing)?
    var viewLogic: (UnlockViewStateLogic & UnlockViewEventsLogic)?
    
    // MARK: Flow Control
    
    private var viewState: Unlock.State = .loading(nil)
    
    // MARK: Object lifecycle

    override func loadView() {
        self.view = viewLogic
    }
    
    // MARK: Setup
    
    override func setup() {
        let viewController = self
        let interactor = UnlockInteractor()
        let presenter = UnlockPresenter()
        let router = UnlockRouter()
        let viewLogic = UnlockView(frame: UIScreen.main.bounds)
        
        viewController.viewLogic = viewLogic
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
        
    override func start() {
        setupEventTargets()
        fetchDoors()
    }
    
    // MARK: Helper Methods
    
    private func fetchDoors() {
        startLoading(with: R.string.localizable.searchingNearestDoor())
        let request = Unlock.FetchDoors.Request()
        interactor?.fetchDoors(request: request)
    }
    
    private func unlockDoor() {
        startLoading(with: R.string.localizable.unlocking())
        let request = Unlock.UnlockDoor.Request()
        interactor?.unlockDoor(request: request)
    }
    
    private func startLoading(with message: String? = nil) {
        viewLogic?.set(state: .loading(message))
    }
    
    private func setupEventTargets() {
        viewLogic?.unlockButton.addTarget(self, action: #selector(unlockButtonTapped), for: .touchUpInside)
        viewLogic?.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    deinit {
        viewLogic?.unlockButton.removeTarget(self, action: #selector(unlockButtonTapped), for: .touchUpInside)
        viewLogic?.backButton.removeTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    // MARK: UI Events
    
    @objc
    private func unlockButtonTapped() {
        unlockDoor()
    }
    
    @objc
    private func backButtonTapped() {
        fetchDoors()
    }
    
}

// MARK: UnlockDisplayLogic

extension UnlockController: UnlockDisplayLogic {
    func displayFetchDoors(viewModel: Unlock.FetchDoors.ViewModel) {
        viewLogic?.set(state: viewModel.state)
        viewLogic?.set(model: viewModel)
    }
    
    func displayUnlockDoor(viewModel: Unlock.UnlockDoor.ViewModel) {
        viewLogic?.set(state: viewModel.state)
        viewLogic?.set(model: viewModel)
    }
}
