//
//  UIViewController.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 25/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

extension UIViewController {
        
    func presentLoading() {

        let loadingIndicator = UIActivityIndicatorView(
            frame: CGRect(x: 10, y: 5, width: 50, height: 50)
        )
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        alert.view.addSubview(loadingIndicator)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func dissmissLoading(completion: (() -> Void)? = nil) {
        presentedViewController?.dismiss(animated: true, completion: completion)
    }
    
    func showAlert(title: String, message: String, handler: (() -> Void)? = nil) {
        if message.isEmpty {
            return
        }
            
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(title: "Ok", style: .default, handler: { _ in
                handler?()
            })
        )
        
        present(alert, animated: true, completion: nil)
    }
}
