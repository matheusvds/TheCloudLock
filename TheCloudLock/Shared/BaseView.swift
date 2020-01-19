//
//  BaseView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 18/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import SnapKit
import UIKit

protocol BaseView: ViewCode {}

class View: UIView, BaseView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {}
    
    func buildConstraints() {}
    
    func addAdditionalConfiguration() {}
}
