//
//  TripperMainButton.swift
//  Tripper
//
//  Created by Margulan Daribayev on 21.03.2021.
//

import UIKit

class TripperMainButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        layer.cornerRadius = 18
        backgroundColor = .systemBlue
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
