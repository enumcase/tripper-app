//
//  CallForActionStackView.swift
//  Tripper
//
//  Created by Margulan Daribayev on 08.06.2021.
//

import UIKit

class CallForActionStackView: UIStackView {

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let actionButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return btn
    }()
    
    init(questionText: String, actionText: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(questionLabel)
        addArrangedSubview(actionButton)
        
        questionLabel.text = questionText
        actionButton.setTitle(actionText, for: .normal)
        
        axis = .horizontal
        alignment = .firstBaseline
        distribution = .fill
        
        questionLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
