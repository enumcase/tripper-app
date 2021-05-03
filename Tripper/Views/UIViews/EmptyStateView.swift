//
//  EmptyStateView.swift.swift
//  Tripper
//
//  Created by Margulan Daribayev on 21.03.2021.
//

import UIKit

class EmptyStateView: UIView {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "No bookmarks, yet 🙁"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.main
        return imageView
    }()

    init() {
        super.init(frame: .zero)
    
        addSubview(placeholderImageView)
        addSubview(messageLabel)
        
        setConstraints()
        
        clipsToBounds = true
        layer.cornerRadius = 18
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setConstraints() {
        let leftRightPadding: CGFloat = 24
            
        NSLayoutConstraint.activate([
            placeholderImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 36),
            placeholderImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftRightPadding),
            placeholderImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -leftRightPadding),
            placeholderImageView.heightAnchor.constraint(equalToConstant: 396),
            
            messageLabel.topAnchor.constraint(equalTo: placeholderImageView.bottomAnchor, constant: 48),
            messageLabel.centerXAnchor.constraint(equalTo: placeholderImageView.centerXAnchor)
        ])
    }
    
}
