//
//  UnlockViewEventsLogic.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

protocol UnlockViewEventsLogic {
    var unlockButton: UIButton { get }
    var backButton: UIButton { get }
}

extension UnlockView: UnlockViewEventsLogic {
    var backButton: UIButton {
        return resultView.backButton
    }
    
    var unlockButton: UIButton {
        return unlockingView.unlockButton
    }
}
