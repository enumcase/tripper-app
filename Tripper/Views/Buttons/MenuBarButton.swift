//
//  MenuBarButton.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class MenuBarButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }

    init(text: String) {
        super.init(frame: .zero)
        setTitleColor(.black, for: .normal)
        setTitleColor(.systemBlue, for: .selected)
        setTitle(text, for: .normal)
        
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
