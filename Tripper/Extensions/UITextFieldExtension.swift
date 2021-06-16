//
//  UITextFieldExtension.swift
//  Tripper
//
//  Created by Margulan Daribayev on 16.06.2021.
//

import UIKit

extension UITextField {
    
    func addBottomBorderOnly() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 16, y: 55, width: UIScreen.main.bounds.width - 32, height: 0.5)
        bottomLine.backgroundColor = UIColor.black.withAlphaComponent(0.3).cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
}
