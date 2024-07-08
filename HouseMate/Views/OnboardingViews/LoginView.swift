//
//  LoginView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LogInViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Housemate")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("text"))
                    .padding()
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        
                    SecureField("Password", text: $viewModel.password)
                    
                    
                    HMButton(title: "Login", background: Color("accent")) {
                        viewModel.login()
                        print("login button pressed")
                    }
                    
                }
                .frame(height: 250)
                .padding(.bottom, 100)
                Spacer()
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                
                Spacer()
            }
        }
        
        
        
        
    }
}

#Preview {
    LoginView()
}
