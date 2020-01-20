//
//  UnlockViewFactory.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 19/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation

/// UnlockViewFactory is used to configure UnlockView references with a view model.
protocol UnlockViewFactory {
    func set(view: inout UnlockView, with model: Unlock.FetchDoors.ViewModel)
    func setLoadingState(view: inout UnlockView)
}

extension UnlockViewFactory {
    func set(view: inout UnlockView, with model: Unlock.FetchDoors.ViewModel) {
        view.unlockingView.doorName.text = model.doorName
        view.unlockingView.doorImage.image = model.doorImage        
        control(view: &view, for: model.state)
    }
    
    func setLoadingState(view: inout UnlockView) {
        control(view: &view, for: .loading)
    }
    
    func control(view: inout UnlockView, for state: Unlock.State) {
        switch state {
            
        case .loading:
            view.loadingView.isHidden = false
            view.errorView.isHidden = true
            view.unlockingView.isHidden = true
        case .error:
            view.loadingView.isHidden = true
            view.errorView.isHidden = false
            view.unlockingView.isHidden = true
        case .initialSuccess:
            view.loadingView.isHidden = true
            view.errorView.isHidden = true
            view.unlockingView.isHidden = false
        case .success:
            view.loadingView.isHidden = true
            view.errorView.isHidden = true
            view.unlockingView.isHidden = false
            
        }
    }
}
