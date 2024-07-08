//
//  TasksView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore




struct TasksView: View {
    @StateObject var viewModel: TasksViewViewModel
    @FirestoreQuery(collectionPath: "tasks", predicates: [.order(by: "dueDate")]
    ) var myTasks: [TaskItem]
    
    @FirestoreQuery(collectionPath: "tasks", predicates: [.order(by: "dueDate")]
    ) var houseTasks: [TaskItem]

    var userId = ""
    
    @State private var houseTasksCollectionPath: String = "households/unknown/tasks"

    
    
    init(userId: String) {
        self.userId = userId
        self._myTasks = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
    
        
        self._viewModel = StateObject(wrappedValue: TasksViewViewModel(userId: userId))
        
//        await viewModel.fetchHousehold(userId: userId)
        self._houseTasksCollectionPath = State(initialValue: "households/\(viewModel.household)/tasks")
        
        

        self._houseTasks = FirestoreQuery(collectionPath: houseTasksCollectionPath)

        print(viewModel.household)
        
        
    }
    
    
    
    var body: some View {
        

        
        VStack {
            Header(title: "Tasks", size: 60)
               
            
            HStack {
                toggleButton(size: 1, optionA: "My Tasks",
                             optionB: "House Tasks",
                             isOptionASelected: $viewModel.isMyTaskSelected)
                .padding(.leading)

                toggleButton(size: 1, optionA: "Week",
                             optionB: "All",
                             isOptionASelected: $viewModel.isWeekSelected)
                .padding(.trailing)
            }
            //.padding(.top, 95)


            // MyTasks Week View
            if $viewModel.isMyTaskSelected.wrappedValue && $viewModel.isWeekSelected.wrappedValue {
                
              
                
                
                //MyTasks All View
            } else if $viewModel.isMyTaskSelected.wrappedValue {
                
                List(myTasks) { task in
                    TaskCardView(card: task)
                        
                }
                    .transition(.move(edge: .leading))
                
                //House Tasks Week View
            } else if $viewModel.isWeekSelected.wrappedValue {
                
                    
                
                //House Tasks All View
            } else {
                
//                List(houseTasks) { task in
//                    TaskCardView(card: task)
//                }
//                    .transition(.move(edge: .trailing))
            }
            
                
            
            
            
            
            
            

            Spacer()
            
            

        }
        .onAppear {
            Task {
                await viewModel.fetchHousehold(userId: userId)
                print(viewModel.household)
                houseTasksCollectionPath = "households/\(viewModel.household)/tasks"
                //print(myTasks)
                print(houseTasks)
                print(houseTasksCollectionPath)
                
            }
        }
        
        
        
        
        
    }
}

#Preview {
    TasksView(userId: "rdcQljKqBNWQS3ftzwse7VGkFRA2")
}
