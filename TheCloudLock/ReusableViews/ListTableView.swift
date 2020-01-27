//
//  ListTableView.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 25/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

class ListTableView: UITableView {
        
    fileprivate lazy var emptyView: UILabel = {
        let emptyView = UILabel()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.textColor = UIColor.black
        emptyView.font = UIFont.boldSystemFont(ofSize: 30)
        emptyView.isHidden = true
        return emptyView
    }()
    
    fileprivate lazy var indicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.backgroundColor = .black
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    override func reloadData() {
        super.reloadData()
        addEmptyState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupCellHeight()
        setupCells()
        setupAppereance()
        buildEmptyView()
    }
    
    private func setupAppereance() {
        separatorStyle = .none
    }
    
    func setupCellHeight() {
        self.rowHeight = UIScreen.main.bounds.height / 5
    }
    
    func setupCells() {
        register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.reuseIdentifier)
    }
    
    private func addEmptyState() {
        if numberOfRows(inSection: 0) == 0 {
            let message = R.string.localizable.nothingHere()
            let emoticon = ["🙈", "🙉", "🙊"].shuffled()[0]
            emptyView.text = "\(message) \(emoticon)"
            emptyView.isHidden = false
            return
        }
        
        emptyView.isHidden = true
    }
    
    private func buildEmptyView() {
        addSubview(emptyView)
        emptyView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()

        }
    }
}

extension UITableViewCell: Identifiable { }
