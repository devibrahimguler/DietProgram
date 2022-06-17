//
//  DietProgram.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 4.06.2022.
//

import SwiftUI

struct DietProgram: Identifiable {
    var id : String = UUID().uuidString
    var image : String
    var date : Date
    var description : String
    var programs : [Programs]
    var isComplated : Bool
}

struct Programs: Hashable {
    var programs : String
    var isProgram : Bool
}

var dietList : [DietProgram] = [
    DietProgram(image: "program1", date: Date.distantFuture.addingTimeInterval(1983), description: "Sabah Yemeği",
                programs: [
                    Programs(programs: "Süt", isProgram: true),
                    Programs(programs: "Su", isProgram: true),
                    Programs(programs: "Yumurta", isProgram: true),
                    Programs(programs: "Peynir", isProgram: true),
                    Programs(programs: "Ekmek", isProgram: true),
                ], isComplated: true),
    DietProgram(image: "program2", date: Date.distantFuture.addingTimeInterval(1984), description: "Ara Yemek",
                programs: [
                    Programs(programs: "Süt", isProgram: true),
                    Programs(programs: "Su", isProgram: true),
                    Programs(programs: "Yumurta", isProgram: true),
                    Programs(programs: "Peynir", isProgram: true),
                    Programs(programs: "Ekmek", isProgram: true),
                ], isComplated: false),
    DietProgram(image: "program3", date: Date.distantFuture.addingTimeInterval(1985), description: "Öğle Yemeği",
                programs: [
                    Programs(programs: "Süt", isProgram: true),
                    Programs(programs: "Su", isProgram: true),
                    Programs(programs: "Yumurta", isProgram: true),
                    Programs(programs: "Peynir", isProgram: true),
                    Programs(programs: "Ekmek", isProgram: true),
                ], isComplated: true),
    DietProgram(image: "program4", date: Date.distantFuture.addingTimeInterval(1986), description: "Ara Yemek",
                programs: [
                    Programs(programs: "Süt", isProgram: true),
                    Programs(programs: "Su", isProgram: true),
                    Programs(programs: "Yumurta", isProgram: true),
                    Programs(programs: "Peynir", isProgram: true),
                    Programs(programs: "Ekmek", isProgram: true),
                ], isComplated: false),
    DietProgram(image: "program5", date: Date.distantFuture.addingTimeInterval(1987), description: "Akşam Yemeği",
                programs: [
                    Programs(programs: "Süt", isProgram: true),
                    Programs(programs: "Su", isProgram: true),
                    Programs(programs: "Yumurta", isProgram: true),
                    Programs(programs: "Peynir", isProgram: true),
                    Programs(programs: "Ekmek", isProgram: true),
                ], isComplated: false),
    DietProgram(image: "program6", date: Date.distantFuture.addingTimeInterval(1988), description: "Ara Yemek",
                programs: [
                    Programs(programs: "Süt", isProgram: true),
                    Programs(programs: "Su", isProgram: true),
                    Programs(programs: "Yumurta", isProgram: true),
                    Programs(programs: "Peynir", isProgram: true),
                    Programs(programs: "Ekmek", isProgram: true),
                ], isComplated: false)
]
