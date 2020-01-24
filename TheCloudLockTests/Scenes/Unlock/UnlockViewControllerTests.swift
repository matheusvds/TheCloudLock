//
//  UnlockViewControllerTests.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 21/01/20.
//  Copyright (c) 2020 AppCompany. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TheCloudLock
import XCTest

class UnlockControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: UnlockController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupUnlockViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupUnlockViewController() {
        sut = UnlockController()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class UnlockBusinessLogicSpy: UnlockBusinessLogic {
        
        var handleFetchDoorsCalled = false
        
        func fetchDoors(request: Unlock.FetchDoors.Request) {
            handleFetchDoorsCalled = true
        }
        
        func unlockDoor(request: Unlock.UnlockDoor.Request) {
            
        }
    }
    
    class UnlockBusinessLogicDummy: UnlockBusinessLogic {
        
        func fetchDoors(request: Unlock.FetchDoors.Request) {}
        func unlockDoor(request: Unlock.UnlockDoor.Request) {}
    }
    
    class ViewLogicSpy: UIView, UnlockViewStateLogic, UnlockViewEventsLogic {
        var backButton: UIButton {
            return UIButton()
        }
        
        var unlockButton: UIButton {
            return UIButton()
        }
        
        var setViewCalled = false
        
        func set(model: Unlock.FetchDoors.ViewModel) {
            setViewCalled = true
        }
        
        func set(model: Unlock.UnlockDoor.ViewModel) {
            
        }
        
        func set(state: Unlock.State) {
            
        }
    }
    
    // MARK: Tests
    
    func testControllerShouldAskInteractorToFetchDoorsWhenViewDidLoad() {
        let spy = UnlockBusinessLogicSpy()
        sut.interactor = spy
        loadView()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.handleFetchDoorsCalled, "viewDidLoad() should ask the interactor to fetch doors")
    }
    
    func testDisplayFetchDoorsShouldSetViewWithViewModel() {
        let dummy = UnlockBusinessLogicDummy()
        let spy = ViewLogicSpy()
        
        sut.interactor = dummy
        sut.viewLogic = spy
        
        let viewModel = Unlock.FetchDoors.ViewModel(state: .fetchDoorsError,
                                                    resultMessage: "",
                                                    items: [])
        
        sut.displayFetchDoors(viewModel: viewModel)
        
        XCTAssertTrue(spy.setViewCalled, "displayFetchDoors should ask the view logic to set the model")
    }
    
    func testControllerShouldSetPropertiesWhenViewDidLoad() {
        let dummy = UnlockBusinessLogicDummy()
        sut.interactor = dummy
        loadView()
        
        sut.viewDidLoad()
        
        XCTAssertNotNil(sut.interactor, "controller should set interactor property when view did load")
        XCTAssertNotNil(sut.viewLogic, "controller should set viewlogic property when view did load")
        XCTAssertNotNil(sut.router, "controller should set router property when view did load")
    }
    
    func testControllerSetTitleWhenViewDidLoad() {
        let dummy = UnlockBusinessLogicDummy()
        sut.interactor = dummy
        loadView()
        
        sut.viewDidLoad()
        
        XCTAssertEqual(sut.title, "Unlock")
    }
}