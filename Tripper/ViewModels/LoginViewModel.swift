//
//  File.swift
//  Tripper
//
//  Created by Arlan on 3/21/21.
//

import Foundation
import Firebase
import SwiftUI
class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var email_register = ""
    @Published var password_register = ""
    @Published var name_register = ""
    @Published var alert = false
    @Published var alertMsg = ""
    @Published var registered = false
    
    @AppStorage("email") var email_stored = ""

    
    @AppStorage("logged") var logged = false
    
    func register() {
        if self.email_register != ""{
            
                Auth.auth().createUser(withEmail: self.email_register, password: self.password_register) { (res, err) in
                    if err != nil{
                        self.alert.toggle()
                        self.alertMsg = err!.localizedDescription
                        return
                    }
                    print("success")
                    self.registered.toggle()
                    self.email_register = ""
                    self.password_register = ""
                }
            
        } else{
            self.alertMsg = "please fill contents properly"
            self.alert.toggle()
        }
    }
    func login() {
        if self.email != "" && self.password != ""{
            
                Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                    if err != nil{
                        self.alert.toggle()
                        self.alertMsg = err!.localizedDescription
                        return
                    }
                    print("success")
                    self.email_stored = self.email
                    self.logged = true
                    SignInViewController.isSignedIn = self.logged
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
         else{
            self.alertMsg = "please fill contents properly"
            self.alert.toggle()
        }
    }
    
}
