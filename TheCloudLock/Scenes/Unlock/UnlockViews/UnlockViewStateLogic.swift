//
//  UnlockViewFactory.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 19/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

protocol UnlockViewStateLogic: UIView {
    func set(model: Unlock.FetchDoors.ViewModel)
    func set(model: Unlock.UnlockDoor.ViewModel)
    func set(state: Unlock.State)
}

extension UnlockView: UnlockViewStateLogic {
    
    func set(model: Unlock.FetchDoors.ViewModel) {
        unlockingView.doorName.text = model.items.first?.doorName
        unlockingView.doorImage.image = model.items.first?.doorImage
        resultView.centerText.text = model.resultMessage
    }
    
    func set(model: Unlock.UnlockDoor.ViewModel) {
        resultView.centerText.text = model.resultMessage
    }
    
    func set(state: Unlock.State) {
        switch state {
        case .loading(let message):
            loadingView.isHidden = false
            unlockingView.isHidden = true
            resultView.isHidden = true
            loadingView.centerText.text = message
        case .fetchDoorsError:
            loadingView.isHidden = true
            unlockingView.isHidden = true
            resultView.isHidden = false
        case .fetchDoorsSuccess:
            loadingView.isHidden = true
            unlockingView.isHidden = false
            resultView.isHidden = true
        case .unlockDoorSucess:
            loadingView.isHidden = true
            unlockingView.isHidden = true
            resultView.isHidden = false
        case .unlockDoorError:
            loadingView.isHidden = true
            unlockingView.isHidden = true
            resultView.isHidden = false
        case .unlockDoorAuthError:
            loadingView.isHidden = true
            unlockingView.isHidden = true
            resultView.isHidden = false
        }
    }
}
