//
//  ListEventViewCell.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 27/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

class ListEventViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupAppearance()
    }
    
    func setupAppearance() {
        textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        detailTextLabel?.font = UIFont.systemFont(ofSize: 10, weight: .light)
        detailTextLabel?.textColor = .black
        textLabel?.numberOfLines = 0
        textLabel?.adjustsFontSizeToFitWidth = true
        selectionStyle = .none
        accessoryType = .none
    }
    
}
