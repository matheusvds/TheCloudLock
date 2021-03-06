//
//  DetailPresenterTests.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright (c) 2020 AppCompany. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TheCloudLock
import XCTest

class DetailPresenterTests: XCTestCase {
  // MARK: Subject under test
  
  var sut: DetailPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupDetailPresenter()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupDetailPresenter() {
    sut = DetailPresenter()
  }
  
  // MARK: Test doubles
  
    class DetailDisplayLogicSpy: DetailDisplayLogic {
        
        var displayCredentialsCalled = false
        var displaySaveCredentialsCalled = false
        
        func displayCredentials(viewModel: Detail.FetchItemCredentials.ViewModel) {
            displayCredentialsCalled = true
        }
        
        func displaySaveCredentials(viewModel: Detail.SaveCredentials.ViewModel) {
            displaySaveCredentialsCalled = true
        }
        
  }
  
  // MARK: Tests
    
    func testPresentCredentialsShouldAskDisplayLogicToOutputViewModel() {
        let spy = DetailDisplayLogicSpy()
        sut.viewController = spy
        
        sut.presentCredentials(response: Detail.FetchItemCredentials.Response(credential: nil, error: nil))
        
        XCTAssert(spy.displayCredentialsCalled, "presentCredentails should ask display logic to output viewModel")
    }
    
    func testPresentSaveCredentialsShouldAskDisplayLogicToOutputViewModel() {
        let spy = DetailDisplayLogicSpy()
        sut.viewController = spy
        
        sut.presentSaveCredentials(response: Detail.SaveCredentials.Response(error: nil))
        
        XCTAssert(spy.displaySaveCredentialsCalled, "presentCredentails should ask display logic to output viewModel")
    }
  
}
