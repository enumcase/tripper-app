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
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.text = "Welcome back,\nSign in to continue your journeys!"
        return label
    }()
    
    private let emailTextField = TripperTextField(placeholder: "Email")
    
    private let signInButton = TripperMainButton(title: "Sign In")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(balloonImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(emailTextField)
        view.addSubview(signInButton)
        
        view.sendSubviewToBack(balloonImageView)
        
        setBalloonImageViewConstraints()
        setWelcomeLabelConstraints()
        setTextFieldConstraints()
        setSignInButtonConstraints()
        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }
    
    @objc private func didTapSignInButton() {
        AuthManager.shared.userIsSignedIn = true
        let tabBarController = TripperTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
    }
    
    /// Constraints
    
    private func setBalloonImageViewConstraints() {
        NSLayoutConstraint.activate([
            balloonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            balloonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balloonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balloonImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50)
        ])
    }
    
    private func setWelcomeLabelConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: balloonImageView.bottomAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
        ])
    }
    
    private func setTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -84),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

}
