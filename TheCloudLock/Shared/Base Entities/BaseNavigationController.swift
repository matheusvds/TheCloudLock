//
//  MainNavigationController.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 18/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    private func configNavigationBar() {
        navigationBar.prefersLargeTitles = true
    }
}
