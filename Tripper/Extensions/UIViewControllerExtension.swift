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
//            alertVC.modalPresentationStyle = .overFullScreen
//            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }

}
