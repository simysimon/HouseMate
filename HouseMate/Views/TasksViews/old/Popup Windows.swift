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


struct taskCreationView: View {
    
    //values used to initialize new task
    var name = ""
    //var users = [User]
    var threshold = 0
    var date = ""
    
    @Binding var isAdd: Bool
    @Binding var isGroups: Bool
    @Binding var isSingle: Bool
    @Binding var dateString: String
    @State private var selectedThreshold: Int? = nil
    
    var body: some View {
        
        ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isAdd = false
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
                                             isOptionASelected: $isGroups)
                                
                                
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
                                
                                
                                Text("Select Threshold")
                                
                                HStack {
                                    
                                    ForEach(1..<7) { number in
                                                    Button(action: {
                                                        selectedThreshold = number
                                                        print("Threshold is \(number)")
                                                    }) {
                                                        Text("\(number)")
                                                            .font(.system(size: 20, weight: .bold, design: .default))
                                                            .frame(width: 45, height: 45)
                                                            .foregroundColor(Color("text"))
                                                            .background(selectedThreshold == number ? Color("accent") : Color("prim"))
                                                            .cornerRadius(25)
                                                    }
                                                }
                                    
                                }
                                
                                Text("Set Date(s)")
                                
                                toggleButton(size: 1, optionA: "Single",
                                             optionB: "Recurring",
                                             isOptionASelected: $isSingle)
                                
                               
                                
                                TextField("MM/dd/yyyy", text: $dateString, onEditingChanged: {_ in 
                                    
                                            })
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                                            .padding()
                                
                                
                                
                                Spacer()
                                
                                
                                
                                
                            }
                            //.frame(alignment: .leading)
                        }
                    
                        
                }
            }
        
    }
    
    
}


struct singleTaskCreationView: View {
    @State var isAdd: Bool
    @Binding var isGroups: Bool
    @Binding var isSingle: Bool
    @Binding var isConstant: Bool



    var body: some View {
        ZStack{
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isAdd = false
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
                                             isOptionASelected: $isGroups)
                                
                                
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
                                
                                
                                Text("Select Threshold")
                                
                                HStack {
                                    
                                    Button(action: {
                                        
                                    }) {
                                        Text("1")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(Color("text"))
                                            .background(Color("prim"))
                                            .cornerRadius(25)
                                    }
                                    Button(action: {
                                        
                                    }) {
                                        Text("2")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(Color("text"))
                                            .background(Color("prim"))
                                            .cornerRadius(25)
                                    }
                                    Button(action: {
                                        
                                    }) {
                                        Text("3")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(Color("text"))
                                            .background(Color("prim"))
                                            .cornerRadius(25)
                                    }
                                    Button(action: {
                                        
                                    }) {
                                        Text("4")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(Color("text"))
                                            .background(Color("prim"))
                                            .cornerRadius(25)
                                    }
                                    Button(action: {
                                        
                                    }) {
                                        Text("5")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(Color("text"))
                                            .background(Color("prim"))
                                            .cornerRadius(25)
                                    }
                                    Button(action: {
                                        
                                    }) {
                                        Text("6")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(Color("text"))
                                            .background(Color("prim"))
                                            .cornerRadius(25)
                                    }
                                    
                                }
                                
                                Text("Set Date(s)")
                                
                                toggleButton(size: 1, optionA: "Single",
                                             optionB: "Recurring",
                                             isOptionASelected: $isSingle)
                                
                                if ($isSingle.wrappedValue) {
                                    
                                    toggleButton(size: 1, optionA: "Constant",
                                                 optionB: "Singular",
                                                 isOptionASelected: $isConstant)
                                    
                                    
                                    @State var selectedOption: Int = 0
                                    threeToggleButton(optionA: "Weekly", optionB: "Biweekly", optionC: "Monthly", selectedOption: $selectedOption)
                                    
                                    
                                    HStack {
                                        Button(action: {
                                            //
                                        }) {
                                            Text("Weekly")
                                                .font(.system(size: 10, weight: .bold, design: .default))
                                                .frame(width: 100, height: 40)
                                                .foregroundColor(Color("text"))
                                                .background(Color("prim"))
                                                .cornerRadius(20)
                                        }
                                        Button(action: {
                                            //
                                        }) {
                                            Text("Biweekly")
                                                .font(.system(size: 10, weight: .bold, design: .default))
                                                .frame(width: 100, height: 40)
                                                .foregroundColor(Color("text"))
                                                .background(Color("prim"))
                                                .cornerRadius(20)
                                        }
                                        Button(action: {
                                            //
                                        }) {
                                            Text("Monthly")
                                                .font(.system(size: 10, weight: .bold, design: .default))
                                                .frame(width: 100, height: 40)
                                                .foregroundColor(Color("text"))
                                                .background(Color("prim"))
                                                .cornerRadius(20)
                                        }
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                
                                Spacer()
                                
                                
                                
                                
                            }
                            //.frame(alignment: .leading)
                        }
                        
                }
            }
    }
    
}

//func popupAdd(isAdd: Binding<Bool>, isGroups: Binding<Bool>, isSingle: Binding<Bool>, isConstant: Binding<Bool>) -> some View  {
//   // @State var isSingle = true
////        var name = ""
////        //var users = [User]
////        var threshold = 0
////        var progress = 0
//   
//    
//    //return singleTaskCreationView(isAdd: isAdd, isGroups: isGroups, isSingle: isSingle, isConstant: isConstant)
//        
//}

#Preview {
    TasksView()
}

