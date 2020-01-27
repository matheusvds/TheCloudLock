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

/// View is used as parent for all custom views.
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

/// BaseScreenView with built-in scrollView
class ScreenView: UIView, BaseView {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.isUserInteractionEnabled = true
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        addSubview(scrollView)
    }
    
    func buildConstraints() {
        scrollView.snp.makeConstraints { make in
            make.centerX.bottom.width.top.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {}
}
