//
//  TopMenuBarStackView.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TopMenuBarStackView: UIStackView {
    
    let summerButton: MenuBarButton = {
        let button = MenuBarButton(text: "Summer")
        button.isSelected = true
        return button
    }()
    let springButton = MenuBarButton(text: "Spring")
    let fallButton = MenuBarButton(text: "Fall")
    let winterButton = MenuBarButton(text: "Winter")
    
    init() {
        super.init(frame: .zero)
    
        translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(summerButton)
        addArrangedSubview(springButton)
        addArrangedSubview(fallButton)
        addArrangedSubview(winterButton)
        
        spacing = 24
        axis = .horizontal
        alignment = .bottom
        
        summerButton.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
