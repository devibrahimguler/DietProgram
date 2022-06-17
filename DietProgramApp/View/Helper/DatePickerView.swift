//
//  DatePickerView.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 7.06.2022.
//

import SwiftUI

struct DatePickerView: View {
    
    @EnvironmentObject var appModel : AppViewModel
    @Binding var date : Date
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.white)
                            .padding()
                    }
                
                HStack(spacing: 10) {
                    
                    Button {
                        withAnimation(.easeInOut(duration: 1)) {
                            appModel.setDate(selectedDate: date)
                            appModel.showDatePicker = false
                        }
                    } label: {
                        Text("SEÇ")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(width:100)
                            .padding(.horizontal,30)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(.blue.opacity(1))
                            }
                    }
                    
                    
                    Button {
                        withAnimation(.easeInOut(duration: 1)) {
                            appModel.showDatePicker = false
                        }
                    } label: {
                        Text("VAZGEÇ")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(width:100)
                            .padding(.horizontal,30)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(.red.opacity(1))
                            }
                    }
                    
                }
                
                
            }
            .offset(y: appModel.showDatePicker ? 0 : -450)
        }
        .opacity(appModel.showDatePicker ? 1 : 0)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
