//
//  UnlockViewEventsLogic.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

/// Defines UI Events for Unlock View
protocol UnlockViewEventsLogic {
    var unlockButton: UIButton { get }
    var backButton: UIButton { get }
}

extension UnlockView: UnlockViewEventsLogic {
        
    /// Input view for the view's backButton
    var backButton: UIButton {
        return resultView.backButton
    }
        
    /// Input view for view's unlockButton
    var unlockButton: UIButton {
        return unlockingView.unlockButton
    }
}
