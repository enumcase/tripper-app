//
//  UIViewControllerExtension.swift
//  Tripper
//
//  Created by Margulan Daribayev on 21.03.2021.
//

import UIKit

extension UIViewController {
    
    func PresentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: buttonTitle, style: .default))
            self.present(alertVC, animated: true)
        }
    }
    
    func showEmptyStateView(in view: UIView) {
        let emptyStateView = EmptyStateView()
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }

}
