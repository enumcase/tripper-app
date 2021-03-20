//
//  CreateTripViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class CreateTripViewController: UIViewController {
    
    private let placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.main
        return imageView
    }()
    
    private let darkenedView = DarkenedView()
    
    private let imageAddButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(ButtonImages.camera, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(placeholderImageView)
        view.addSubview(darkenedView)
        view.addSubview(imageAddButton)
        setConstraints()
    }

    private func setConstraints() {
        let leftRightPadding: CGFloat = 24
        
        NSLayoutConstraint.activate([
            placeholderImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            placeholderImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightPadding),
            placeholderImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightPadding),
            placeholderImageView.heightAnchor.constraint(equalToConstant: 197),
            
            darkenedView.topAnchor.constraint(equalTo: placeholderImageView.topAnchor),
            darkenedView.bottomAnchor.constraint(equalTo: placeholderImageView.bottomAnchor),
            darkenedView.leadingAnchor.constraint(equalTo: placeholderImageView.leadingAnchor),
            darkenedView.trailingAnchor.constraint(equalTo: placeholderImageView.trailingAnchor),
            
            imageAddButton.centerYAnchor.constraint(equalTo: placeholderImageView.centerYAnchor),
            imageAddButton.centerXAnchor.constraint(equalTo: placeholderImageView.centerXAnchor),
            imageAddButton.widthAnchor.constraint(equalToConstant: 64),
            imageAddButton.heightAnchor.constraint(equalTo: imageAddButton.widthAnchor)
        ])
    }
    
}
