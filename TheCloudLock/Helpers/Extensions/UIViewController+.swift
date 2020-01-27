//
//  UIViewController.swift
//  TheCloudLock
//
//  Created by Matheus Vasconcelos on 25/01/20.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Presents a loading for any UIViewController
    func presentLoading() {

        let loadingIndicator = UIActivityIndicatorView(
            frame: CGRect(x: 10, y: 5, width: 50, height: 50)
        )
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        let alert = UIAlertController(title: nil,
                                      message: R.string.localizable.pleaseWait(),
                                      preferredStyle: .alert)
        alert.view.addSubview(loadingIndicator)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    /// Dismiss the presented view for any UIViewController
    /// Used to dismissLoading
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
            UIAlertAction(title: R.string.localizable.commonOk(), style: .default, handler: { _ in
                handler?()
            })
        )
        
        present(alert, animated: true, completion: nil)
    }
}
