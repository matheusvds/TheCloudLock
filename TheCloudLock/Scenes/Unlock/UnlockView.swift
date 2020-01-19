//
//  UnlockView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 18/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import Foundation
import UIKit

class UnlockView: View {
    
     // MARK: View Elements
    
    lazy var container: UIView = {
        return UIView()
    }()
        
    // MARK: View Code
    
    override func setupHierarchy() {
        addSubview(container)
    }
    
    override func buildConstraints() {
        container.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    override func addAdditionalConfiguration() {
        backgroundColor = .white
        container.backgroundColor = .black
    }
}
