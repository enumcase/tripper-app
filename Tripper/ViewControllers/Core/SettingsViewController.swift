//
//  SettingsViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit
//import Firebase

class SettingsViewController: UIViewController {
    
    private let logOutButton = TripperMainButton(title: "Log Out")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(logOutButton)
        setConstraints()
        
        logOutButton.addTarget(self, action: #selector(didTapLogOutButton), for: .touchUpInside)
    }
    
    @objc func didTapLogOutButton() {
//        do {
//            try Auth.auth().signOut()
//            LoginViewModel().$logged.wrappedValue = false
//            let vc = SignInViewController()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//        } catch {
//            print("Error while logging out")
//        }
    }
    
    private func setConstraints() {
        let leftRightPadding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36),
            logOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightPadding),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightPadding)
        ])
    }

}
