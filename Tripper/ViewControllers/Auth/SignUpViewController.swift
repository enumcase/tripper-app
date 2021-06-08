//
//  SignUpViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 08.05.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Sign Up"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
