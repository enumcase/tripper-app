//
//  UITextFieldExtension.swift
//  Tripper
//
//  Created by Margulan Daribayev on 05.06.2021.
//

import UIKit

extension UITextField {
    
    func useUnderline() {
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.borderColor = UIColor.red.cgColor
        bottomLine.backgroundColor = UIColor.red.cgColor
        bottomLine.borderWidth = 1
        borderStyle = .none
        layer.addSublayer(bottomLine)
        layer.masksToBounds = true
    }
    
}
