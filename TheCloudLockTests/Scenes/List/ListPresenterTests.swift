//
//  ListPresenterTests.swift
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

class ListPresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: ListPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupListPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupListPresenter() {
        sut = ListPresenter()
    }
    
    // MARK: Test doubles
    
    class ListDisplayLogicSpy: ListDisplayLogic {
        var displayFetchItemsCalled = false
        var displayFetchedCredentialsCalled = false
        var itemsViewModel: List.FetchItems.ViewModel?
        var credentialsViewModel: List.FetchItemCredentials.ViewModel?
        
        func displayFetchedItems(viewModel: List.FetchItems.ViewModel) {
            displayFetchItemsCalled = true
            self.itemsViewModel = viewModel
        }
        
        func displayFetchedCredentials(viewModel: List.FetchItemCredentials.ViewModel) {
            displayFetchedCredentialsCalled = true
            self.credentialsViewModel = viewModel
        }
    }
    
    // MARK: - Fetch Items Tests
    
    func testPresentFetchedItemsShouldAskDisplayLogicToOutputViewModel() {
        let spy = ListDisplayLogicSpy()
        sut.viewController = spy
        
        let response = List.FetchItems.Response(items: [Seeds.Door.hallway], error: nil)
        sut.presentFetchedItems(response: response)
        
        XCTAssert(spy.displayFetchItemsCalled)
    }
    
    func testPresentFetchedItemsShouldDisplayFormattedViewModel() {
        let spy = ListDisplayLogicSpy()
        sut.viewController = spy
    
        let items = [Seeds.Door.hallway]
        let response = List.FetchItems.Response(items: items, error: nil)
        sut.presentFetchedItems(response: response)
        
        for item in items {
            XCTAssertEqual(item.name, "Living Room", "fetchItems should properly format name")
        }
    }
    
    func testPresentFetchedItemsShouldDisplayFormattedErrorMessageWithError() {
        let spy = ListDisplayLogicSpy()
        sut.viewController = spy
        
        let response = List.FetchItems.Response(items: [], error: .cannotFetchItems)
        sut.presentFetchedItems(response: response)
        
        XCTAssertEqual(spy.itemsViewModel?.resultMessage,
                       "We could not find any items 😰",
                       "presentFetchItems should display correct error message")
    }
    
    func testPresentFetchedCredentialsShouldAskDisplayLogicToOutputViewModel() {
        let spy = ListDisplayLogicSpy()
        sut.viewController = spy
        
        let response = List.FetchItemCredentials.Response(error: nil)
        sut.presentFetchedCredentials(response: response)
        
        XCTAssert(spy.displayFetchedCredentialsCalled,
                  "fetchCredentials should ask display logic to output viewModel")
    }
    
    func testPresentFetchedCredentialsShouldDisplayFormattedViewModelWithEmptyMessage() {
        let spy = ListDisplayLogicSpy()
        sut.viewController = spy
    
        let response = List.FetchItemCredentials.Response(error: nil)
        sut.presentFetchedCredentials(response: response)
        
        XCTAssertEqual(spy.credentialsViewModel?.resultMessage, "",
                       "fetchCredentials should  display empty resultMessage")
    }
    
    func testPresentFetchedCredentialsShouldDisplayFormattedErrorMessageWithError() {
        let spy = ListDisplayLogicSpy()
        sut.viewController = spy
        
        let response = List.FetchItemCredentials.Response(error: .cannotFetchCredentials)
        sut.presentFetchedCredentials(response: response)
        
        XCTAssertEqual(spy.credentialsViewModel?.resultMessage,
                       "There's something wrong 😰",
                       "fetchCredentials should display correct error message")
    }
}