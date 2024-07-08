//
//  CommonViewViewModel.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import Foundation


class HeaderViewViewModel: ObservableObject {
    @Published var  isBell = false
    @Published var  isProfile = false
    @Published var isAdd = false
    
    init() {
        
    }
    
}
