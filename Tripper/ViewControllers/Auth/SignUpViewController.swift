//
//  SignUpViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 08.05.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    private let balloonImageView = AuthPageImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Sign Up"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(balloonImageView)
        
        setConstraints()
    }
    
    /// Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            balloonImageView.topAnchor.constraint(equalTo: view.topAnchor),
            balloonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balloonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balloonImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50)
        ])
    }

}
