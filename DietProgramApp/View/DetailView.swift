//
//  DetailView.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 7.06.2022.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var appModel : AppViewModel
    var dietProgram : DietProgram
    @Namespace var animation
    @State var isComplite : Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 5) {
                HStack {
                    Image(dietProgram.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    Spacer()
                    
                    VStack(alignment: .leading ,spacing: 0){
                        Text("İbrahim")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Güler")
                            .font(.callout)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,30)
                .padding(.vertical, 10)
                
                ForEach(dietProgram.programs, id: \.self) { program in
                    ProgramCard(program: program)
                        .opacity(isComplite ? 0 : 1)
                        .animation(.easeInOut(duration: 1), value: isComplite)
                }
                
            }
            .padding()
            .padding(.bottom, 100)
        }
        .navigationTitle(dietProgram.description)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
    
    @ViewBuilder
    func ProgramCard(program : Programs) -> some View {
        HStack(spacing: 10) {
            
            Text("\(program.programs)".uppercased())
                .font(.system(size: 25, design: .monospaced))
            
            
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dietProgram: dietList[0])
            .environmentObject(AppViewModel.init())
    }
}
