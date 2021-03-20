//
//  LoginView.swift
//  Tripper
//
//  Created by Arlan on 3/20/21.
//

import SwiftUI

struct LoginView: View {
    var backgroundColor: UIColor?
        var titleColor: UIColor?
    @ObservedObject var model : LoginViewModel
    @State var email = ""
    @State var password = ""
    init(backgroundColor: UIColor?, titleColor: UIColor?, model: LoginViewModel) {
            self.backgroundColor = backgroundColor
            let coloredAppearance = UINavigationBarAppearance()
            coloredAppearance.configureWithTransparentBackground()
            coloredAppearance.backgroundColor = backgroundColor
            coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
            coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

            UINavigationBar.appearance().standardAppearance = coloredAppearance
            UINavigationBar.appearance().compactAppearance = coloredAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        self.model = model
        }
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("main").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width - 50)
                    Spacer()
                }
            VStack{
                Text("Welcome Back,").foregroundColor(.secondary)
                Text("Sign in to continue your journeys!").foregroundColor(.secondary).padding(.bottom, 60)
                
                VStack(spacing: 10){
                    TextField("email", text: $model.email).frame(height: 40).padding(.horizontal,60).font(.system(size: 18))
                Divider().padding(.horizontal, 40)
                    SecureField("password", text: $model.password).frame(height: 40).padding(.horizontal,60).font(.system(size: 18))
                Divider().padding(.horizontal, 40).padding(.bottom, 80)
                }
                Button(action: {model.login()}, label:{
                    Text("Sign In").frame(width: UIScreen.main.bounds.width - 60, height: 50).background(Color.blue).foregroundColor(.white).cornerRadius(12)
                }).padding(.bottom, 30)
                
                HStack{
                    Text("Don't have an account?").font(.system(size: 14))
                    NavigationLink(destination: SignUpView(model: self.model), isActive: $model.registered, label: {
                        Text("create account").font(.system(size: 14))
                    })
                    
                }
                
                Spacer()
            }.padding(.top, UIScreen.main.bounds.width - 30).navigationBarTitle("Sign In")
            
            }.edgesIgnoringSafeArea(.vertical)
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .alert(isPresented: $model.alert, content: {
            Alert(title: Text("Error"), message: Text(model.alertMsg), dismissButton: .default(Text("Ok")))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(backgroundColor: nil, titleColor: nil, model: LoginViewModel())
    }
}

struct SignUpView: View {
    @ObservedObject var model: LoginViewModel
    @State var email = ""
    @State var password = ""
    @State var name = ""
    var body: some View {
     
            ZStack{
                VStack{
                    Image("main").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width - 50)
                    Spacer()
                }
            VStack{
                Text("Sign up to experience the joy of trips with other people!").foregroundColor(.secondary).padding(.bottom, 60)
                VStack(spacing: 10){
                TextField("Name", text: $name).autocapitalization(.none).frame(height: 40).padding(.horizontal,60).font(.system(size: 18))
                    Divider().padding(.horizontal, 40)
                    TextField("email", text: $model.email_register).autocapitalization(.none).frame(height: 40).padding(.horizontal,60).font(.system(size: 18))
                Divider().padding(.horizontal, 40)
                    SecureField("password", text: $model.password_register).frame(height: 40).padding(.horizontal,60).font(.system(size: 18))
                Divider().padding(.horizontal, 40).padding(.bottom, 20)
                }
                Button(action: {model.register()}, label:{
                    Text("Sign Up").frame(width: UIScreen.main.bounds.width - 60, height: 50).background(Color.blue).foregroundColor(.white).cornerRadius(12)
                }).padding(.bottom, 30)
                
                HStack{
                    Text("Already have an account?").font(.system(size: 14))
                    NavigationLink(destination: LoginView(backgroundColor: nil, titleColor: nil, model: self.model), label: {
                        Text("Sign In").font(.system(size: 14))
                    })
                    
                }
                
                Spacer()
            }.padding(.top, UIScreen.main.bounds.width - 30).navigationBarTitle("Sign Up")
            }.edgesIgnoringSafeArea(.vertical)
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $model.alert, content: {
                Alert(title: Text("Error"), message: Text(model.alertMsg), dismissButton: .default(Text("Ok")))
            })
        
    }
}

