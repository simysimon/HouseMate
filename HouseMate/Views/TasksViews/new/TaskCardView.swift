//
//  TaskCardView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import SwiftUI

struct TaskCardView: View {
    @StateObject var viewModel = TaskCardViewViewModel()
    let card: TaskItem
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("accent"))
                .frame(width: 100, height: 100)
                .padding(12)
                .overlay(
                    VStack {
                        
                        Text("\(formatDate(Date(timeIntervalSince1970: card.dueDate)))")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(Color("background"))
                            .padding(.bottom, 5)
                        HStack (spacing: -15){
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("text"))
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("text"))
                        }
                        .frame(width: 100)
                    }
                )
            VStack {
                Text(card.title)
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(Color("text"))
                    .padding(.top)
                    .padding(.leading, -10)
                    .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
                Spacer()
                
                
                
                HStack {
                    ForEach(0..<(Int(card.progress) ?? 0), id: \.self) { _ in
                        Image(systemName: "checkmark.circle.fill")
                            .frame(maxWidth: 20, alignment: .leading)
                            .foregroundColor(Color("accent"))
                            .padding(.leading, -10)
                            .padding(.bottom, 25)
                            .padding(.trailing, 5)
                    }
                    ForEach(0..<(Int(card.threshold) ?? 0) - (Int(card.progress) ?? 0), id: \.self) { _ in
                        Image(systemName: "circle.dotted")
                            .frame(maxWidth: 20, alignment: .leading)
                            .padding(.leading, -10)
                            .padding(.bottom, 25)
                            .padding(.trailing, 5)
                    }
                    Spacer()
                }
            }
            .frame(width: 200, alignment: .topLeading)
            Spacer()
        }
        .frame(width: 350, height: 125)
        .background(Color("prim"))
        .clipShape(RoundedRectangle(cornerRadius: 30))    }
}

#Preview {
    TaskCardView(card: .init(
        id: "123", title: "Clean Bathroom", threshold: "4", progress: "3", dueDate: Date().timeIntervalSince1970
    ))
    
}
