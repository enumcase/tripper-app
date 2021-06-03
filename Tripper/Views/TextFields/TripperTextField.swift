//
//  TripperTextField.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripperTextField: UITextField {

    init(placeholder: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
