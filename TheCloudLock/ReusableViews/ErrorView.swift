//
//  ErrorView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import SnapKit
import UIKit

class ErrorView: View {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizable.commonBack(), for: .normal)
        button.setTitleColor(.darkPurple, for: .highlighted)
        button.backgroundColor = .lightPurple
        button.layer.cornerRadius = 18
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    override func setupHierarchy() {
        addSubview(backButton)
        addSubview(label)
    }
    
    override func buildConstraints() {
        label.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        backButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(label.snp.bottom)
        }
    }
}
