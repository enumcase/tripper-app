//
//  SignInViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit
import SwiftUI

class SignInViewController: UIViewController {
    
    private let balloonImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "main")
        return iv
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.text = "Welcome back,\nSign in to continue your journeys!"
        return label
    }()
    
    private let emailTextField = TripperTextField(placeholder: "Email", keyboardType: .emailAddress)
    
    private let signInButton = TripperMainButton(title: "Sign In")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Sign In"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(balloonImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(emailTextField)
        view.addSubview(signInButton)
        
        view.sendSubviewToBack(balloonImageView)
        
        setConstraints()
        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }
    
    @objc private func didTapSignInButton() {
        AuthManager.shared.userIsSignedIn = true
        let tabBarController = TripperTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
    }
    
    /// Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            balloonImageView.topAnchor.constraint(equalTo: view.topAnchor),
            balloonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balloonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balloonImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            
            welcomeLabel.topAnchor.constraint(equalTo: balloonImageView.bottomAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            
            emailTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            signInButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -84),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

}
