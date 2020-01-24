//
//  UnlockView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 18/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation
import UIKit

class UnlockView: ScreenView {
    
    // MARK: View Elements
    
    lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var loadingView: LoadingUnlockView = {
        let view = LoadingUnlockView()
        view.isHidden = true
        return view
    }()
    
    lazy var unlockingView: DoorView = {
        let view = DoorView()
        view.isHidden = true
        return view
    }()
    
    lazy var resultView: ResultView = {
        let view = ResultView()
        view.isHidden = true
        return view
    }()
    
    // MARK: View Code
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        scrollView.addSubview(container)
        container.addSubview(loadingView)
        container.addSubview(unlockingView)
        container.addSubview(resultView)
    }
    
    override func buildConstraints() {
        super.buildConstraints()
        
        container.snp.makeConstraints { make in
            make.width.top.bottom.equalTo(scrollView)
            make.height.equalTo(scrollView).multipliedBy(0.9)
            make.left.right.equalTo(self)
        }
        
        loadingView.snp.makeConstraints { make in
            make.height.equalTo(loadingView.snp.width).multipliedBy(0.54)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
        }
        
        resultView.snp.makeConstraints { make in
            make.height.equalTo(resultView.snp.width).multipliedBy(0.54)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
        }
        
        unlockingView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(unlockingView.snp.width).multipliedBy(1.6)
            make.width.equalToSuperview().multipliedBy(0.7)
            
        }
    }
    
    override func addAdditionalConfiguration() {
        backgroundColor = .clear
        scrollView.backgroundColor = .white
        container.backgroundColor = .white
    }
}
