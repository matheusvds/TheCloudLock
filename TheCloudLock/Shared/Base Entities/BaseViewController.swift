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

class Controller: UIViewController, BaseViewController, Identifiable {

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        setTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {}
    
    func start() {}
    
    /// Sets controller titles according to the object's idenfier.
    func setTitle() {
        var title = Self.reuseIdentifier
        title = title.replacingOccurrences(of: "View", with: "")
        title = title.replacingOccurrences(of: "Controller", with: "")
        self.title = title
    }
}
