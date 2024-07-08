//
//  HouseholdView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/8/24.
//

import SwiftUI

struct HouseholdView: View {
    @EnvironmentObject var mainViewModel: MainViewViewModel
    @StateObject var viewModel = HouseholdViewViewModel()
    @State var isError = false
    var body: some View {
        
        
        NavigationView {
            VStack {
                Text("Housemate")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("text"))
                    .padding()
                
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                
                Form {
                    if $viewModel.isJoin.wrappedValue {
                        
                        
                        
                        
                        TextField("Household ID", text: $viewModel.householdID)
                        
                        
                        
                        HMButton(title: "Join Household", background: Color("accent")) {
                            viewModel.checkHouseholdExists()
                            viewModel.joinHousehold()
                            mainViewModel.fetchHousehold()
                            print("isHouseholdExists = \(viewModel.isHouseholdExists)")
                            print("isError = \(isError)")
                        
                        }
                        
                    } else {
                        TextField("Name", text: $viewModel.name)
                        
                        TextField("Groups (group1, group2, group3, etc)", text: $viewModel.groups)
                        
                        
                        
                        HMButton(title: "Create Household", background: Color("accent")) {
                            viewModel.createHousehold()
                            mainViewModel.fetchHousehold()

                            
                        }

                        
                        
                    }
                    
                    
                }
                .frame(height: $viewModel.isJoin.wrappedValue ? 220 : 260)
                .padding(.bottom, 100)
                
                Spacer()
                VStack {
                    Text($viewModel.isJoin.wrappedValue ? "Household doesn't exist?" : "Household exists?")
                    Button(action: {
                        viewModel.toggleIsJoin()
                    }, label: {
                        Text($viewModel.isJoin.wrappedValue ? "Create A Household" : "Join A Household")
                    })
                    
                }
                
                Spacer()
                
            }
            
        }
    }
}


#Preview {
    HouseholdView()
}
