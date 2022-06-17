//
//  AppViewModel.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 4.06.2022.
//

import SwiftUI

class AppViewModel: ObservableObject {
    
    @Published var currentTab : Tab = .home
    @Published var showDatePicker : Bool = false
    @Published var currentItem : DietProgram?
    @Published var date : String = Date().getFormattedDate(format: "MMM dd yyyy")
    
    func setDate(selectedDate: Date) {
        self.date = selectedDate.getFormattedDate(format: "MMM dd yyyy")
    }
    
}
