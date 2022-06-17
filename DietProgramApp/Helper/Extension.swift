//
//  Extension.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 4.06.2022.
//

import SwiftUI

extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        guard let safeArea = screen.windows.first?.safeAreaInsets else { return .zero }
        return safeArea
    }
    
    @ViewBuilder
    func setUPTab() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.white
                    .ignoresSafeArea()
            }
    }
}

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
