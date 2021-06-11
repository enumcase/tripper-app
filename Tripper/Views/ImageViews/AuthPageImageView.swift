//
//  AuthPageImageView.swift
//  Tripper
//
//  Created by Margulan Daribayev on 11.06.2021.
//

import UIKit

class AuthPageImageView: UIImageView {

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        contentMode = .scaleAspectFill
        image = UIImage(named: "main")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
