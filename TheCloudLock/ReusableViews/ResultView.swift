//
//  SuccessView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation
import SnapKit

/// ResultView is used to display information in a label-an- button format
class ResultView: View {
        
    /// The label with the main information message to be displayed
    lazy var centerText: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.unlockedFree()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    /// Add a taget to backButton to set an action for the view
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizable.commonBack(), for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 18
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    override func setupHierarchy() {
        addSubview(backButton)
        addSubview(centerText)
    }
    
    override func buildConstraints() {
        centerText.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        backButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(centerText.snp.bottom)
        }
    }
}
