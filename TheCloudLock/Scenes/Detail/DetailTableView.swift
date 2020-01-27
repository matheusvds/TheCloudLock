//
//  DetailTableView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 26/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

class DetailTableView: ListTableView {
    override func setupCells() {
        register(DetailCell.self, forCellReuseIdentifier: DetailCell.reuseIdentifier)
    }
    
    override func setupCellHeight() {
        rowHeight = UIScreen.main.bounds.height / 7
    }
}

class DetailCell: ListTableViewCell {
    override func setupAppearance() {
        textLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        selectionStyle = .none
    }
}
