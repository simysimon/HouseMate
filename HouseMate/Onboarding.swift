//
//  Onboarding.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/26/24.
//

import Foundation
import SwiftUI
import Firebase


struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var onboardingComplete = false
    @Binding var isLoggedIn: Bool

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingPageView(imageName: "house", title: "Welcome to Housemate", description: "Organize your living.")
                    .tag(0)
                OnboardingPageView(imageName: "checkmark", title: "Chores", description: "Delegate housework.")
                    .tag(1)
                OnboardingPageView(imageName: "dollarsign", title: "Expenses", description: "Reimburse shared costs.")
                    .tag(2)
                OnboardingPageView(imageName: "calendar", title: "Events", description: "Schedule household events.")
                    .tag(3)
                AuthenticationView(isLoggedIn: $isLoggedIn)
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle())

        
            if !onboardingComplete{
                Button(action: {
                    if currentPage < 3 {
                        currentPage += 1
                    } else {
                        // Complete onboarding and navigate to main app
                        currentPage += 1
                        onboardingComplete = true
                        
                        
                        
                        
                    }
                }) {
                    Text(currentPage < 3 ? "Next" : "Get Started")
                        .padding()
                        .background(Color("accent"))
                        .foregroundColor(Color("sec"))
                        .cornerRadius(10)
                }
                .padding()
            }
            
        }
    }
}


struct OnboardingPageView: View {
    let imageName: String
    let title: String
    let description: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .foregroundColor(Color("prim"))
            Text(title)
                .font(.largeTitle)
                .padding(.top, 20)
                .foregroundColor(Color("text"))
            Text(description)
                .font(.body)
                .padding(.top, 10)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .foregroundColor(Color("text"))
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//       // OnboardingView(isLoggedIn: $isLoggedIn)
//    }
//}




struct HouseholdView: View {
    @State private var isLoginMode = true
    @State private var isJoin = false
    
    
    var body: some View {
        ZStack{
            VStack {
                Text(isJoin ? "Join Household" : "Create Household")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("text"))
                    .padding()
                
                
                
                toggleButton(size : 2, optionA: "Join Household", optionB: "Create Household", isOptionASelected: $isJoin)
                
                
                
                if isJoin {
                    JoinView()
                        .transition(.move(edge: .leading))
                } else {
                    CreateView()
                        .transition(.move(edge: .trailing))
    
                }
                
                
                
                Spacer()
            }
            .padding()
        }
        
    }
}

struct JoinView: View {
    var body: some View {
        VStack{
            
            Text("Enter invite code")
                .foregroundColor(Color("text"))
                .padding(.top, 25)
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("text"))
                .frame(width: 350, height: 50)
                .overlay(alignment: .center){
                    TextField("Invite Code", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding()
                        
                }
                .padding()
                
            
            Button(action: {
                //
            }) {
                Text("JOIN")
                    .bold()
                    .frame(width: 175, height: 50)
                    .foregroundColor(Color("text"))
                    .background(Color("prim"))
                    .cornerRadius(20)
            }
                
            Spacer()
        }
        

    }
}

struct CreateView: View {
    var body: some View {
        Text("Name your household")
        
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color("text"))
            .frame(width: 350, height: 50)
            .overlay(alignment: .center){
                TextField("Household Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    
            }
            .padding()
        
        
        Text("Create groups")
        
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color("text"))
            .frame(width: 350, height: 50)
            .overlay(alignment: .center){
                HStack{
                    TextField("Group Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding()
                    Button(action: {
                        
                    }) {
                        Text("+")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(Color("text"))
                            .frame(width: 30, height: 30)
                            .background(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(Color("prim"))
                            
                                        
                        
                            .padding()
                    }
                }
                
                    
            }
            .padding()
        
        HStack {
            Text("Basement")
                .frame(width: 120, height: 40)
                .background(Color("sec"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            Text("1st Floor")
                .frame(width: 120, height: 40)
                .background(Color("sec"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text("2nd Floor")
                .frame(width: 120, height: 40)
                .background(Color("sec"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Spacer()
                
        }
      //  .frame(alignment: .leading)
        
        
        
        
        Button(action: {
            //
        }) {
            Text("Create Household")
                .bold()
                .frame(width: 175, height: 50)
                .foregroundColor(Color("text"))
                .background(Color("prim"))
                .cornerRadius(20)
        }
        .padding(.top, 50)
        
    }
}




