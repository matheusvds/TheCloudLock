//
//  ListTableViewCell.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 25/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupAppearance()
    }
    
    func setupAppearance() {
        textLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        selectionStyle = .none
        accessoryView?.tintColor = .lightGray
        accessoryType = .disclosureIndicator
    }
}
