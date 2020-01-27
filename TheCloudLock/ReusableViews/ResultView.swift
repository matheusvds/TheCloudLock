//
//  SuccessView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 23/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation
import SnapKit

class ResultView: View {
    
    lazy var centerText: UILabel = {
        let label = UILabel()
        label.text = "Unlocked! You're free to go!"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
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
