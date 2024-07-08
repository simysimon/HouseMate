//
//  RegisterView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            Text("Register")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color("text"))
                .padding()
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                
                HMButton(title: "Create Account", background: Color("accent")) {
                    viewModel.register()
                    print("register button pressed")
                }
            }
            
            
        }
    }
}

#Preview {
    RegisterView()
}
