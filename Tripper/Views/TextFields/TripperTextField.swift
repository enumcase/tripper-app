//
//  TripperTextField.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripperTextField: UITextField {

    init(placeholder: String, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        
//        let bottomLine = CALayer()
//        bottomLine.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
//        bottomLine.backgroundColor = UIColor.white.cgColor
//        self.borderStyle = .none
//        self.layer.addSublayer(bottomLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
