//
//  ListViewController.swift
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

protocol ListDisplayLogic: class {
    func displayFetchedItems(viewModel: List.FetchItems.ViewModel)
    func displayFetchedCredentials(viewModel: List.FetchItemCredentials.ViewModel)
}

class ListController<T: Item>: Controller, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - VIP Cycle
    
    var interactor: ListBusinessLogic?
    var router: (NSObjectProtocol & ListRoutingLogic & ListDataPassing)?
    
    // MARK: - Views

    let tableView = ListTableView<T>()
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Data
    
    private var items: [Item] = []
    
    // MARK: - Control
    
    private var state: List.State = .loading {
        didSet(newState) {
            display(state: newState)
        }
    }
    
    // MARK: - Object lifecycle
    
    override func loadView() {
        self.view = tableView
    }
    
    override func setTitle() {
        self.title = T.entityName
    }
    // MARK: - Setup
    
    override func setup() {
        let viewController = self
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        let router = ListRouter<T>()
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
        setAddItemButton()
        setupRefresh()
        fetchItems()
    }
    
    private func setAddItemButton() {
        guard T.editable else {
            return
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addItem))
    }
    
    private func setupRefresh() {
        refreshControl.addTarget(self, action: #selector(fetchItems), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    // MARK: - BusinessLogic Calls
        
    @objc
    private func fetchItems() {
        display(state: .loading)
        let request = List.FetchItems.Request()
        interactor?.fetchItems(type: T.self, request: request)
    }
    
    private func addNewItem(with name: String) {
        self.display(state: .loading)
        let request = List.FetchItems.Request(name: name)
        self.interactor?.fetchItems(type: T.self, request: request)
    }
    
    private func removeItem(at row: Int) {
        display(state: .loading)
        let request = List.FetchItems.Request(row: row)
        interactor?.fetchItems(type: T.self, request: request)
    }
    
    private func getCredentials(at row: Int) {
        display(state: .loading)
        let request = List.FetchItemCredentials.Request(id: items[row].id,
                                                        name: items[row].name)
        interactor?.fetchCredentials(type: T.self, request: request)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: T.entityName,
                                                 for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
         cell.detailTextLabel?.text = item.detail
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            removeItem(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return T.editable
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard T.selectable else {
            return
        }
        getCredentials(at: indexPath.row)
    }
    
    // MARK: - UIAlerts
    
    @objc
    private func addItem() {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.becomeFirstResponder()
            textField.placeholder = R.string.localizable.typeNameHere()
            textField.backgroundColor = nil
            textField.keyboardAppearance = .default
            textField.keyboardType = .default
            textField.returnKeyType = .done
        }
        
        alert.addAction(
            UIAlertAction(title: R.string.localizable.commonAdd(), style: .default, handler: { _ in
                if let text = alert.textFields?.first?.text {
                    self.addNewItem(with: text)
                }
            })
        )
        
        alert.addAction(
            UIAlertAction(title: R.string.localizable.commonCancel(), style: .cancel, handler: nil)
        )
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showErrorAlert(with message: String, handler: (() -> Void)? = nil) {
        showAlert(title: R.string.localizable.commonError(), message: message, handler: handler)
    }
    
}

// MARK: - ListDisplayLogic

extension ListController: ListDisplayLogic {
    
    // MARK: - Diplay Fetched Items
    
    func displayFetchedItems(viewModel: List.FetchItems.ViewModel) {
        if !viewModel.resultMessage.isEmpty {
            self.display(state: .ready)
            showErrorAlert(with: viewModel.resultMessage)
            return
        }
        
        items = viewModel.items
        display(state: .ready)
    }
    
    // MARK: - Diplay Fetched Credentials
    
    func displayFetchedCredentials(viewModel: List.FetchItemCredentials.ViewModel) {
        if !viewModel.resultMessage.isEmpty {
            self.display(state: .ready) {
                self.showErrorAlert(with: viewModel.resultMessage)
            }
            return
        }
        
        display(state: .ready) {
            self.router?.routeToDetails(type: T.self)
        }
    }
}

// MARK: - StateHandler

extension ListController {
    private func display(state: List.State, completion: (() -> Void)? = nil) {
        switch state {
        case .loading:
            if !self.refreshControl.isRefreshing {
                DispatchQueue.main.async {
                    self.presentLoading()
                }
            }
        case .ready:
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.dissmissLoading(completion: completion)
        }
    }
}
