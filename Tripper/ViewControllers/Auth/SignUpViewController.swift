//
//  SignUpViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 08.05.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    private let balloonImageView = AuthPageImageView()
    
    private let signUpLabel = AuthPageTextLabel(text: "Sign up to experience the joy\nof trips with other people!")
    
    private let nameTextField = TripperTextField(placeholder: "Name")
    
    private let emailTextField = TripperTextField(placeholder: "Email", keyboardType: .emailAddress)
    
    private let passwordTextField = TripperTextField(placeholder: "Password", isSecureTextEntry: true)
    
    private let signUpButton = TripperMainButton(title: "Sign Up")
    
    private let haveAnAccountLabel = CallForActionStackView(questionText: "Already have an account?", actionText: "Sign In")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Sign Up"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(balloonImageView)
        view.addSubview(signUpLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        view.addSubview(haveAnAccountLabel)
        
        setConstraints()
        
        signUpButton.addTarget(self, action: #selector(didTapSignUpPageButton), for: .touchUpInside)
        
        haveAnAccountLabel.actionButton.addTarget(self, action: #selector(didTapSignUpPageButton), for: .touchUpInside)
    }
    
    @objc func didTapSignUpPageButton() {
        let signInVC = SignInViewController()
        let signInNC = UINavigationController(rootViewController: signInVC)
        signInNC.modalPresentationStyle = .fullScreen
        present(signInNC, animated: true)
    }
    
    /// Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            balloonImageView.topAnchor.constraint(equalTo: view.topAnchor),
            balloonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balloonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balloonImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            
            signUpLabel.topAnchor.constraint(equalTo: balloonImageView.bottomAnchor, constant: 16),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            
            nameTextField.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -118),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            haveAnAccountLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 32),
            haveAnAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            haveAnAccountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }

}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
