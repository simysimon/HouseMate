//
//  AuthenticationView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/27/24.
//

import SwiftUI
import FirebaseAuth


struct AuthenticationView: View {
    @State private var isLoginMode = true
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Binding var isLoggedIn: Bool
    var body: some View {
        VStack {
            Text(isLoginMode ? "Login" : "Create Account")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color("text"))
                .padding()

            if !isLoginMode{
                TextField("Name", text: $name)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.bottom, 20)
            }
            
            
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.bottom, 20)

            SecureField("Password", text: $password)
                .textContentType(.newPassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, isLoginMode ? 40 : 20)

            if !isLoginMode {
                SecureField("Confirm Password", text: $confirmPassword)
                    .textContentType(.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.bottom, 40)
            }

            Button(action: handleAuthAction) {
                Text(isLoginMode ? "Login" : "Create Account")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)

            Button(action: { isLoginMode.toggle() }) {
                Text(isLoginMode ? "Create an Account" : "Already have an account? Login")
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding()
    }

    private func handleAuthAction() {
        if isLoginMode {
            // Handle login action
           
            
            print("Login with email: \(email), password: \(password)")
            
            isLoggedIn = true
            print("isLoggedIn set to true")
            
            
        } else {
            // Handle create account action
            if password == confirmPassword {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print("Error creating user: \(error.localizedDescription)")
                        
                    } else if authResult != nil {
                        print("account created with \(email)")
                        isLoggedIn = true
                        print("isLoggedIn set to true")
                        
                        let user = User(name: name)
                        saveUser(user: user)
                    }
                    
                    
                    
                    }
                } else {
                    print("Passwords do not match")
            }
        }
    }
}

//#Preview {
//    AuthenticationView(isLoggedIn: $isLoggedIn)
//}
