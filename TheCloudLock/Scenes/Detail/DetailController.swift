//
//  DetailViewController.swift
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

protocol DetailDisplayLogic: class {
    func displayCredentials(viewModel: Detail.FetchItemCredentials.ViewModel)
    func displaySaveCredentials(viewModel: Detail.SaveCredentials.ViewModel)
}

class DetailController<T: Item>: Controller, DetailDisplayLogic, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - VIP Cycle
    
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    // MARK: - Data
    
    private var items: [DisplayedCredentialItem] = []
    private var lazyTitle: String?

    // MARK: - Views
    
    let tableView: DetailTableView = DetailTableView<T>()
    
    override func loadView() {
        self.view = tableView
    }
    
    // MARK: - Setup
    
    override func setup() {
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter<T>()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        tableView.delegate = viewController
        tableView.dataSource = viewController
    }
    
    override func start() {
        setSaveButton()
        fetchDetails()
    }
    
    override func setTitle() {
        self.title = lazyTitle
    }
    
    private func setSaveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.commonSave(),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(saveCredentials))
    }
    
    // MARK: - BusinessLogic Calls
    
    @objc
    private func saveCredentials() {
        presentLoading()
        let request = Detail.SaveCredentials.Request(
            items: self.items.map({ CredentialItem(id: String(), name: $0.name, active: $0.active) })
        )
        interactor?.saveCredentials(type: T.self, request: request)
    }
    
    private func fetchDetails() {
        let request = Detail.FetchItemCredentials.Request()
        interactor?.fetchCredentials(request: request)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.reuseIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.accessoryType = .checkmark
        setAcessory(cell: cell, for: item.active)
        return cell
    }
    
    private func setAcessory(cell: UITableViewCell, for state: Bool) {
        cell.tintColor = state ? .green : .gray
    }
    
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].active = !items[indexPath.row].active
        tableView.reloadData()
    }

}

// MARK: - DisplayLogic

extension DetailController {
    
    func displayCredentials(viewModel: Detail.FetchItemCredentials.ViewModel) {
        self.items = viewModel.items
        self.lazyTitle = viewModel.title
        tableView.reloadData()
        dissmissLoading()
    }
    
    func displaySaveCredentials(viewModel: Detail.SaveCredentials.ViewModel) {
        dissmissLoading {
            if viewModel.resultMessage.isEmpty {
                self.showAlert(title: R.string.localizable.commonSuccess(),
                               message: R.string.localizable.dataSaved()) {
                    self.dismiss(animated: true, completion: nil)
                }
                return
            }
            
            self.showAlert(title: R.string.localizable.commonError(),
                           message: viewModel.resultMessage)
        }
    }
}
