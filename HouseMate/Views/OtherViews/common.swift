//
//  common.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/21/24.
//

import Foundation
import SwiftUI



//this is the common header for all the views
struct Header: View {
    @StateObject var viewModel = HeaderViewViewModel()
    //@StateObject var tasksViewViewModel: TasksViewViewModel
    let title : String
    let size : CGFloat
    
    
    var body: some View {
        HStack{
            Text(title)
                .font(.custom("SF Pro Text", size: size))
                .bold()
                .padding(.leading, 20)
                .foregroundColor(Color("text"))
            
            
            if title != "Home" {
                Button(action: {
                    withAnimation{
                        viewModel.isAdd.toggle()
                    }
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("text"))
                }
                .sheet(isPresented: $viewModel.isAdd) {
                    if title == "Tasks" {
                        CreateTaskView(newTaskPresented: $viewModel.isAdd)
                    }
                    if title == "Expenses" {
                        
                    }
                    if title == "Events" {
                        
                    }
                }
            }
            
            
            Spacer()
            Button(action: {
                withAnimation{
                    viewModel.isBell.toggle()
                }
                
            }) {
                Image(systemName: "bell")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("text"))
            }
            
            Button(action: {
                withAnimation{
                    viewModel.isProfile.toggle()
                }
                
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("text"))
            }
            .padding()
            .sheet(isPresented: $viewModel.isProfile) {
                ProfileView()
            }            
            
            
            
            
        }
    }
}



struct HMButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            
            Text(title)
                .foregroundColor(Color("background"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(background)
                .cornerRadius(30)
        }
        .padding()
    }
    
}




#Preview{
    //Header(title: "Tasks", size: 60)
    HMButton(title: "Value", background: Color("accent")){
        print("login button pressed")
    }
}

//this is the 2option toggle button, currently only 2 parameters for the options. should add more in future for dimensions and more options.
struct toggleButton: View {
    var size : CGFloat
    var optionA : String
    var optionB : String
    @Binding var isOptionASelected: Bool
    var body: some View {
        ZStack {
            // Background layer
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("prim"))
                .frame(width: 180*size, height: 40)
            
            // Sliding highlight layer
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("accent"))
                .frame(width: 85*size, height: 30)
                .offset(x: isOptionASelected ? -43*size : 43*size)
            
            
            // Text buttons layer
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        isOptionASelected = true
                    }
                }) {
                    Text(optionA)
                        .font(.system(size: 10+size, weight: .bold, design: .default))
                        //.padding()
                        .frame(width: 90*size, height: 25)
                        .background(Color.clear) // Set background to clear
                        .foregroundColor(Color("text"))
                        .cornerRadius(30)
                }
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        isOptionASelected = false
                    }
                }) {
                    Text(optionB)
                        .font(.system(size: 10+size, weight: .bold, design: .default))
                        //.padding(.trailing)
                        .frame(width: 90*size, height: 25)
                        .background(Color.clear) // Set background to clear
                        .foregroundColor(Color("text"))
                        .cornerRadius(30)
                }
            }
        }
        .frame(width: 180*size, height: 40) // Adjust the size of the rectangular prism
        .cornerRadius(30)
        
    }
}

// three button option
struct threeToggleButton: View {
    var optionA: String
    var optionB: String
    var optionC: String
    @Binding var selectedOption: Int  // 0 for A, 1 for B, 2 for C

    var body: some View {
        ZStack {
            // Background layer
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("prim"))
                .frame(width: 270, height: 40)

            // Sliding highlight layer
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("accent"))
                .frame(width: 80, height: 30)
                .offset(x: selectedOption == 0 ? -90 : selectedOption == 1 ? 0 : 90)

            // Text buttons layer
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        selectedOption = 0
                        print("selected option: 0")
                    }
                }) {
                    Text(optionA)
                        .font(.system(size: 10, weight: .bold, design: .default))
                        .frame(width: 90, height: 25)
                        .background(Color.clear) // Set background to clear
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }

                Button(action: {
                    withAnimation(.easeInOut) {
                        selectedOption = 1
                        print("selected option: 1")

                    }
                }) {
                    Text(optionB)
                        .font(.system(size: 10, weight: .bold, design: .default))
                        .frame(width: 90, height: 25)
                        .background(Color.clear) // Set background to clear
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }

                Button(action: {
                    withAnimation(.easeInOut) {
                        selectedOption = 2
                        print("selected option: 2")

                    }
                }) {
                    Text(optionC)
                        .font(.system(size: 10, weight: .bold, design: .default))
                        .frame(width: 90, height: 25)
                        .background(Color.clear) // Set background to clear
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }
            }
        }
        .frame(width: 270, height: 40) // Adjust the size of the rectangular prism
        .cornerRadius(30)
    }
}
