//
//  LoadingUnlockView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 19/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import SnapKit

class LoadingUnlockView: View {
    
    lazy var centerText: UILabel = {
        let label = UILabel()
        label.text = "Searching nearest door"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.startAnimating()
        return view
    }()
    
    override func setupHierarchy() {
        addSubview(activityView)
        addSubview(centerText)
    }
    
    override func buildConstraints() {
        centerText.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        activityView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(centerText.snp.bottom)
        }
    }
    
    override func addAdditionalConfiguration() {
//        centerText.backgroundColor = .green
    }
    
}
