//
//  Home.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 4.06.2022.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var appModel : AppViewModel
    var animation : Namespace.ID
    
    @State var isOkey : Bool = false
    @State var date : Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                
                Text("Diet Program")
                    .font(.system(size: 30, design: .serif).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        appModel.showDatePicker = true
                    }
                } label: {
                    Text("\(appModel.date)")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.gray.opacity(0.5))
                        .padding(.horizontal, 80)
                }
               
                VStack(spacing: 10) {
                    ForEach(dietList) { dietProgram in
    
                        DietCard(dietProgram: dietProgram)
                            .onTapGesture {
                                isOkey = true
                                appModel.currentItem = dietProgram
                            }

                    }
                }
                .padding(.bottom, 80)
            }
        }
        .overlay {
            DatePickerView(date: self.$date)
                .environmentObject(appModel)
        }
        .overlay {
            DeitailConnection(dietProgram: appModel.currentItem ?? dietList[0])
                .opacity(isOkey ? 1 : 1)
        }
    }
    
    @ViewBuilder
    func DeitailConnection(dietProgram : DietProgram) -> some View {
        ZStack {
            Color.gray
                .opacity(0.5)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 100, alignment: .center)
                .background {
                    VStack {
                        HStack {
                            Image("\(dietProgram.image)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            
                            Text("\(dietProgram.description)")
                        }
                        
                        ForEach(dietProgram.programs, id: \.self) { program in
                            HStack {
                                
                                Text("\(program.programs)")
                            }
                        }
                    }
                }
            
            
        }
    }
    
    @ViewBuilder
    func DietCard(dietProgram : DietProgram) -> some View {
        HStack(alignment: .center, spacing: 15) {
            Image(dietProgram.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.green.opacity(0.2))
                }
            
            VStack(alignment: .leading, spacing: 15) {

                Text(dietProgram.description)
                    .font(.title)
                    .foregroundColor(.black.opacity(0.8))

                Text(dietProgram.isComplated ? "Yapıldı" : "Yapılmadı")
                    .font(.callout.bold())
                    .frame(maxWidth: .infinity)
                    .foregroundColor(dietProgram.isComplated ? .blue : .red)
                    .padding(.vertical, 5)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white.opacity(0.5))
                            .padding(.horizontal, 20)
                    
                    }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.cyan.opacity(0.4))
        }
        .padding(.horizontal,10)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
