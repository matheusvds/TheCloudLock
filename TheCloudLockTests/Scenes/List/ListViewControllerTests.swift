//
//  ListViewControllerTests.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 26/01/20.
//  Copyright (c) 2020 AppCompany. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TheCloudLock
import XCTest

class ListViewControllerTests: XCTestCase {
    // MARK: - Subject under test

    var sut: ListController<Doors>!
    var window: UIWindow!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupListViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: - Test setup

    func setupListViewController() {
        sut = ListController<Doors>()
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: - Test doubles
    class ListBusinessLogicDummy: ListBusinessLogic {
        func fetchItems<T>(type: T.Type, request: List.FetchItems.Request) where T: Item {}
        
        func fetchCredentials<T>(type: T.Type, request: List.FetchItemCredentials.Request) where T: Item {}
    }

    class ListBusinessLogicSpy: ListBusinessLogic {
        var fetchItemsCalled = false
        var fetchCredentialsCalled = false
        
        func fetchItems<T>(type: T.Type, request: List.FetchItems.Request) where T: Item {
            fetchItemsCalled = true
        }
        
        func fetchCredentials<T>(type: T.Type, request: List.FetchItemCredentials.Request) where T: Item {
            fetchCredentialsCalled = true
        }
    }
    
    class ListRoutingLogicSpy: NSObject, ListRoutingLogic, ListDataPassing {
        var dataStore: ListDataStore?
    
        var routeToDetailsCalled = false
        
        func routeToDetails<T>(type: T.Type) where T: Item {
            routeToDetailsCalled = true
        }
    }
    
    // MARK: - Fetch Items Tests

    func testShouldFetchItemsWhenViewLoads() {
        let spy = ListBusinessLogicSpy()
        sut.interactor = spy
        loadView()
        
        sut.viewDidLoad()
        
        XCTAssert(spy.fetchItemsCalled, "should fetchItems when view loads")
    }
    
    // MARK: - Fetch Credentials
    
    func testShouldFetchCredentialsWhenSelected() {
        let viewModel = List.FetchItems.ViewModel(
            items: [Seeds.Model.sam, Seeds.Model.happy],
            resultMessage: ""
        )
        let spy = ListBusinessLogicSpy()
        sut.interactor = spy
        loadView()
        sut.displayFetchedItems(viewModel: viewModel)

        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(spy.fetchCredentialsCalled, "fetchCrendentials should be called when an item is selected")
    }
    
    func testDisplayFetchItemWithFilledResultMessageShouldShowError() {
        let viewModel = List.FetchItems.ViewModel(
            items: [],
            resultMessage: "message"
        )
        let dummy = ListBusinessLogicDummy()
        sut.interactor = dummy
        loadView()
        sut.displayFetchedItems(viewModel: viewModel)
        
        guard let alert = sut.presentedViewController as? UIAlertController else {
            XCTFail("view controller should be displaying an alert view")
            return
        }
        
        XCTAssert(alert.isBeingPresented, "displayfetchItem should display an error alert")
    }
    
    func testShouldFetchItemsWhenRefreshed() {
        let spy = ListBusinessLogicSpy()
        sut.interactor = spy
        loadView()
        
        sut.tableView.refreshControl?.beginRefreshing()
        
        XCTAssert(spy.fetchItemsCalled, "fetchCrendentials should be called when an item is selected")
    }
    
}