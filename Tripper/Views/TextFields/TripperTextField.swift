//
//  TripperTextField.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripperTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

    init(placeholder: String, keyboardType: UIKeyboardType = .default, isSecureTextEntry: Bool = false) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
        
        heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 16, y: 56, width: UIScreen.main.bounds.width - 32, height: 0.5)
        bottomLine.backgroundColor = UIColor.black.withAlphaComponent(0.75).cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
