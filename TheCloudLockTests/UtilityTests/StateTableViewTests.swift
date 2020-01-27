//
//  StateTableViewTests.swift
//  TheCloudLockTests
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

@testable import TheCloudLock
import XCTest

class StateTableViewTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: StateTableViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Setup
    
    func setupViewController() {
        sut = StateTableViewController()
    }

    // MARK: Tests
    
    func testFetchSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(spy.fetchSuccessCalled)
    }
    
    func testFetchError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 0))

        XCTAssert(spy.fetchErrorCalled)
    }
    
    func testUnlockSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 1))

        XCTAssert(spy.unlockSuccessCalled)
    }

    func testUnlockError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 1))

        XCTAssert(spy.unlockErrorCalled)
    }

    func testUnlockPermissionError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 2, section: 1))

        XCTAssert(spy.unlockPermissionErrorCalled)
    }
    
    func testfetchItemsError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 2))

        XCTAssert(spy.fetchItemsErrorCalled)
    }

    func testfetchItemsEmptyState() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 2))

        XCTAssert(spy.fetchItemsEmptyStateCalled)
    }
    
    func testfetchItemsDoorsSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 3))

        XCTAssert(spy.fetchItemsDoorsSuccessCalled)
    }

    func testfetchItemsRemoveDoorsSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 3))

        XCTAssert(spy.fetchItemsRemoveDoorsSuccessCalled)
    }

    func testfetchDoorsCredentialsSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 2, section: 3))

        XCTAssert(spy.fetchDoorsCredentialsSuccessCalled)
    }

    func testfetchDoorsCredentialsError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 3, section: 3))

        XCTAssert(spy.fetchDoorsCredentialsErrorCalled)
    }

    func testfetchDoorsCredentialsEmpty() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 4, section: 3))

        XCTAssert(spy.fetchDoorsCredentialsEmptyCalled)
    }

    func testFetchItemsUsersSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 4))

        XCTAssert(spy.fetchItemsUsersSuccessCalled)
    }

    func testFetchItemsRemoveUsersSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 4))

        XCTAssert(spy.fetchItemsRemoveUsersSuccessCalled)
    }

    func testFetchUserCredentialsSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 2, section: 4))

        XCTAssert(spy.fetchUserCredentialsSuccessCalled)
    }

    func testfetchUserCredentialsError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 3, section: 4))

        XCTAssert(spy.fetchUserCredentialsErrorCalled)
    }

    func testfetchUserCredentialsEmpty() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 4, section: 4))

        XCTAssert(spy.fetchUserCredentialsEmptyCalled)
    }

    func testsaveUserCredentialsSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 5))

        XCTAssert(spy.saveUserCredentialsSuccessCalled)
    }

    func testsaveUserCredentialsError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 5))

        XCTAssert(spy.saveUserCredentialsErrorCalled)
    }

    func testsaveDoorCredentialsSuccess() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 2, section: 5))

        XCTAssert(spy.saveDoorCredentialsSuccessCalled)
    }

    func testsaveDoorCredentialsError() {
        let spy = ResponseMockSpy.self
        sut.response = spy
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 3, section: 5))

        XCTAssert(spy.saveDoorCredentialsErrorCalled)
    }
}
