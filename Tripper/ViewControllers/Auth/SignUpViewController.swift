//
//  SignUpViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 08.05.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    private let balloonImageView = AuthPageImageView()
    
    private let signUpButton = TripperMainButton(title: "Sign Up")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Sign Up"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(balloonImageView)
        view.addSubview(signUpButton)
        
        setConstraints()
    }
    
    /// Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            balloonImageView.topAnchor.constraint(equalTo: view.topAnchor),
            balloonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balloonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balloonImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            
            signUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -118),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

}
