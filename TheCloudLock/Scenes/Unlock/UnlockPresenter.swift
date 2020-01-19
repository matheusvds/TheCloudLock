//
//  UnlockPresenter.swift
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

protocol UnlockPresentationLogic {
  func presentSomething(response: Unlock.Something.Response)
}

class UnlockPresenter: UnlockPresentationLogic {
  weak var viewController: UnlockDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Unlock.Something.Response) {
    let viewModel = Unlock.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}