//
//  SignInViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit
import SwiftUI

class SignInViewController: UIViewController {
    
    private let balloonImageView = AuthPageImageView()
    
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
    
    private let passwordTextField = TripperTextField(placeholder: "Password", isSecureTextEntry: true)
    
    private let signInButton = TripperMainButton(title: "Sign In")
    
    private let createAccountLabel = CallForActionStackView(questionText: "Don’t have an account?", actionText: "Create account")
    
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
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(createAccountLabel)
        
        setConstraints()
        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        createAccountLabel.actionButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
    }
    
    @objc private func didTapSignInButton() {
        AuthManager.shared.userIsSignedIn = true
        let tabBarController = TripperTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
    }
    
    @objc private func didTapCreateAccountButton() {
        let signUpVC = SignUpViewController()
        let signUpNC = UINavigationController(rootViewController: signUpVC)
        signUpNC.modalPresentationStyle = .fullScreen
        present(signUpNC, animated: true)
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
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            signInButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -118),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            createAccountLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 32),
            createAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            createAccountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }

}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
