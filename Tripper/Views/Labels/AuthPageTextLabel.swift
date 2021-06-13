//
//  AuthPageTextLabel.swift
//  Tripper
//
//  Created by Margulan Daribayev on 13.06.2021.
//

import UIKit

class AuthPageTextLabel: UILabel {

    init(text: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        textColor = .secondaryLabel
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textAlignment = .center
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
