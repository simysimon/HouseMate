//
//  CreateTaskView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import SwiftUI

struct CreateTaskView: View {
    @StateObject var viewModel = CreateTaskViewViewModel()
    @Binding var newTaskPresented: Bool
//    @Binding var isGroups: Bool
//    @Binding var isSingle: Bool
    @State private var selectedThreshold: Int? = nil
    
    var body: some View {
        
        VStack {
            
            Form {
                TextField("Title", text: $viewModel.title)
                
                TextField("Threshold", text: $viewModel.threshold)
                                    .keyboardType(.numberPad) // Use .decimalPad if you need decimal numbers
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(DefaultDatePickerStyle())
                
                HMButton(title: "Create Task", background: Color("accent")) {
                    Task {
                        if await viewModel.save() {
                            newTaskPresented = false
                            print("Household: \(viewModel.household)")
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                }
                .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select a due date tat is today or newer"))
            })
            
//
//            Spacer()
//            RoundedRectangle(cornerRadius: 50)
//                .fill(Color("sec"))
//                .frame(width: 400, height: 720)
//                .padding(.bottom, -35)
//                .overlay{
//                    VStack {
//                        Text("Create a Task")
//
//                        Text("Task Title")
//
//
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color("text"), lineWidth: 3)
//                            .frame(width: 200, height: 50)
//                            .overlay{
//                                TextField("New Task", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                            }
//
//
//                        Text("Assign People")
//
////                        toggleButton(size: 1, optionA: "Groups",
////                                     optionB: "Individuals",
////                                     isOptionASelected: $isGroups)
//
//
//
//                        Text("Select Threshold")
//
//                        HStack {
//
//                            ForEach(1..<7) { number in
//                                            Button(action: {
//                                                selectedThreshold = number
//                                                print("Threshold is \(number)")
//                                            }) {
//                                                Text("\(number)")
//                                                    .font(.system(size: 20, weight: .bold, design: .default))
//                                                    .frame(width: 45, height: 45)
//                                                    .foregroundColor(Color("text"))
//                                                    .background(selectedThreshold == number ? Color("accent") : Color("prim"))
//                                                    .cornerRadius(25)
//                                            }
//                                        }
//
//                        }
//
//                        Text("Set Date(s)")
//
////                        toggleButton(size: 1, optionA: "Single",
////                                     optionB: "Recurring",
////                                     isOptionASelected: $isSingle)
//
//
//
////                        TextField("MM/dd/yyyy", text: $dateString, onEditingChanged: {_ in
////
////                                    })
////                                    .padding()
////                                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
////                                    .padding()
//
//
//
//                        Spacer()
//
//
//
//
//                    }
//                    //.frame(alignment: .leading)
//                }
//
//
        }
        
        
        
    }
}

#Preview {
    
//    @Binding var isGroups = true
//    @Binding var isSingle = true
    CreateTaskView(newTaskPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
