//
//  DoorView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 19/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import SnapKit

class DoorView: View {
    
    lazy var doorImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFill
        view.tintColor = .white
        return view
    }()
    
    lazy var doorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var unlockButton: UIButton = {
        let button = UIButton()
        button.setTitle("let's unlock it!", for: .normal)
        button.setTitleColor(.darkPurple, for: .highlighted)
        button.backgroundColor = .lightPurple
        button.layer.cornerRadius = 18
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    override public func draw(_ rect: CGRect) {
        let gradient = CAGradientLayer()
        gradient.frame = doorImage.bounds
        gradient.colors = [UIColor.darkPurple.cgColor, UIColor.lightPurple.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0.2, y: 1)
        gradient.cornerRadius = 10
        if gradient.superlayer == nil {
            layer.insertSublayer(gradient, at: 0)
        }
    }

    override func setupHierarchy() {
        addSubview(doorImage)
        addSubview(doorName)
        addSubview(unlockButton)
    }
    
    override func buildConstraints() {
        doorImage.snp.makeConstraints { make in
            make.height.equalTo(doorImage.snp.width)
            make.width.equalToSuperview()
            make.centerX.top.equalToSuperview()
        }
        
        doorName.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(doorImage.snp.bottom).offset(5)
        }
        
        unlockButton.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
    }
    
    override func addAdditionalConfiguration() {
        
    }
    
}
