//
//  Data.swift
//  NiceList
//


import Foundation

struct QuoteDataModel : Identifiable {
    
    var id: String {
        return latin
    }
    
    var latin : String
    var russian : String
    var expanded = false
}

struct SectionDataModel : Identifiable {
    
    var id: Character {
        return letter
    }
    
    var letter : Character
    var quotes : [QuoteDataModel]
    var expanded = false
}

class UserData : ObservableObject {
    @Published var latinities : [SectionDataModel] = [
        SectionDataModel(letter: "C", quotes: [
            QuoteDataModel(latin: "Calvitium non est vitium, sed prudentiae indicium.", russian: "Лысина не порок, а свидетельство мудрости."),
            QuoteDataModel(latin: "Conjecturalem artem esse medicinam.", russian: "Медицина есть искусство догадок."),
            QuoteDataModel(latin: "Crede firmiter et pecca fortiter!", russian: "Верь крепче и греши смелее!")]),
        SectionDataModel(letter: "H", quotes: [
            QuoteDataModel(latin: "Homo sine religione sicut equus sine freno.", russian: "Человек без религии что лошадь без удил."),
            QuoteDataModel(latin: "Habet et musca splenem.", russian: "Разозлиться может и муха.")]),
        SectionDataModel(letter: "M", quotes: [
            QuoteDataModel(latin: "Malum est mulier, sed necessarium malum.", russian: "Хоть женщина и зло, но зло необходимое."),
            QuoteDataModel(latin: "Mulierem ornat silentium.", russian: "Женщину красит молчанье.")])]
}
