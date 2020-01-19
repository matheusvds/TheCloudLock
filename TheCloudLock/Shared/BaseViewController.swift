//
//  BaseViewController.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 18/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

protocol BaseViewController {
    func setup()
    func start()
}

class Controller: UIViewController, BaseViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {}
    
    func start() {}
}
