//
//  Popup Windows.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/26/24.
//

import Foundation
import SwiftUI

func popupNotif(isBell: Binding<Bool>) -> some View {
    ZStack {
        Color.black.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    isBell.wrappedValue = false
                }
            }

        // Popup window
        ScrollView {
            VStack {
                Notification(title: "Shut", time: "2 min ago")
                Notification(title: "Shut the", time: "2 min ago")
                Notification(title: "Shut the fuck", time: "2 min ago")
                Notification(title: "Shut the fuck up", time: "2 min ago")
                Notification(title: "Shut the fuck up bitch", time: "2 min ago")
                Notification(title: "", time: "2 min ago")
            }
        }
        .padding(.leading, 175)
        .padding(.top, 80)
        
    }
    
}
func popupDropdown(isDropdown: Binding<Bool>, isAdd: Binding<Bool>) -> some View {

    ZStack {
        Color.black.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    isDropdown.wrappedValue = false
                }
            }

        // Popup window
        VStack {
            
            Button(action: {
                isAdd.wrappedValue.toggle()
            }) {
                Text("Add")
                    .frame(width: 175, height: 50)
                    .foregroundColor(Color("text"))
                    .background(Color("sec"))
                    .cornerRadius(20)
            }
            Button(action: {
                print("edit button tapped")
            }) {
                Text("Edit")
                    .frame(width: 175, height: 50)
                    .foregroundColor(Color("text"))
                    .background(Color("sec"))
                    .cornerRadius(20)
            }
        }
        .transition(.move(edge: .top))
        .offset(x: -5, y: -255)
        
    }
}



func popupProfile(isProfile: Binding<Bool>) -> some View {
    ZStack {
        Color.black.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    isProfile.wrappedValue = false
                }
            }

        // Popup window
        VStack {
            
            Button(action: {
                print("profile button tapped")
            }) {
                Text("Profile")
                    .frame(width: 175, height: 50)
                    .foregroundColor(Color("text"))
                    .background(Color("sec"))
                    .cornerRadius(20)
            }
            Button(action: {
                print("settings button tapped")
            }) {
                Text("Settings")
                    .frame(width: 175, height: 50)
                    .foregroundColor(Color("text"))
                    .background(Color("sec"))
                    .cornerRadius(20)
            }
        }
        .transition(.move(edge: .top))
        .offset(x: 100, y: -255)
        
    }
}



func popupAdd(isAdd: Binding<Bool>, isGroups: Binding<Bool>) -> some View  {
    
       
    
        ZStack{
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        isAdd.wrappedValue = false
                    }
                }
            
            
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color("sec"))
                    .frame(width: 400, height: 720)
                    .padding(.bottom, -35)
                    .overlay{
                        VStack {
                            Text("Create a Task")
                            
                            Text("Task Title")
                            
                            
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("text"), lineWidth: 3)
                                .frame(width: 200, height: 50)
                                .overlay{
                                    TextField("New Task", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                }
                                
                            
                            Text("Assign People")
                            
                            toggleButton(size: 1, optionA: "Groups",
                                         optionB: "Individuals",
                                         isOptionASelected: isGroups)
                            
                            
                            HStack {
                                Button(action: {
                                    print("basement button")
                                }) {
                                    Text("Basement")
                                        .font(.system(size: 10, weight: .bold, design: .default))
                                        .frame(width: 100, height: 40)
                                        .foregroundColor(Color("text"))
                                        .background(Color("prim"))
                                        .cornerRadius(20)
                                }
                                
                                Button(action: {
                                    print("1st Floor button")
                                }) {
                                    Text("1st Floor")
                                        .font(.system(size: 10, weight: .bold, design: .default))
                                        .frame(width: 100, height: 40)
                                        .foregroundColor(Color("text"))
                                        .background(Color("prim"))
                                        .cornerRadius(20)
                                }
                                
                                Button(action: {
                                    print("2nd Floor button")
                                }) {
                                    Text("2nd Floor")
                                        .font(.system(size: 10, weight: .bold, design: .default))
                                        .frame(width: 100, height: 40)
                                        .foregroundColor(Color("text"))
                                        .background(Color("prim"))
                                        .cornerRadius(20)
                                }
                            }
                            
                            

                            
                            Spacer()
                            
                            
                            
                            
                        }
                        //.frame(alignment: .leading)
                    }
                    
            }
        }
        
        
    
    
    
    
}
