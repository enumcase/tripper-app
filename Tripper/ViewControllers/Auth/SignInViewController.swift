//
//  SignInViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit
import SwiftUI

class SignInViewController: UIViewController {
    
    static var isSignedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
//        let childView = UIHostingController(rootView: LoginView(backgroundColor: nil, titleColor: nil, model: LoginViewModel()))
//        addChild(childView)
//        childView.view.frame = view.bounds
//        view.addSubview(childView.view)
//        childView.didMove(toParent: self)
    }

}
