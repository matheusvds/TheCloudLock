//
//  LoadingUnlockView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 19/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import SnapKit

/// View used to display a loading-with-activityIndicator format
class CustomLoadingView: View {
    
    /// The label with the main information message to be displayed
    lazy var centerText: UILabel = {
        let label = UILabel()
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
}
