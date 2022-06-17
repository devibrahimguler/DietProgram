//
//  MainView.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 4.06.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var appModel : AppViewModel = .init()
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $appModel.currentTab) {
            Home(animation: animation)
                .environmentObject(appModel)
                .tag(Tab.home)
                .setUPTab()
            
            Text("Advice")
                .environmentObject(appModel)
                .tag(Tab.advice)
                .setUPTab()
            
            Text("Calendar")
                .environmentObject(appModel)
                .tag(Tab.calendar)
                .setUPTab()
            
            Text("Profile")
                .environmentObject(appModel)
                .tag(Tab.profile)
                .setUPTab()
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(currentTab: $appModel.currentTab, animation: animation)
                .offset(y: appModel.showDatePicker ? 150 : 0)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
