//
//  ContentView.swift
//  NiceList
//


import SwiftUI


struct ContentView: View {
    
    @ObservedObject var userData = UserData()
    
    func sectionIndex(section : SectionDataModel) -> Int {
        userData.latinities.firstIndex(where: {$0.letter == section.letter})!
    }
    
    func quoteIndex(section : Int, quote : QuoteDataModel) -> Int {
        return userData.latinities[section].quotes.firstIndex(where: {$0.latin == quote.latin})!
    }
    
    var body: some View {
        List {
            ForEach(userData.latinities) { section in
                Section(header: HeaderView(section: section)
                    .onTapGesture {
                        self.userData.latinities[self.sectionIndex(section: section)].expanded.toggle()
                }, footer: EmptyView()) {
                    if section.expanded {
                        ForEach(section.quotes) { quote in
                            QuoteView(quote: quote)
                                .onTapGesture {
                                    let sectionIndex = self.sectionIndex(section: section)
                                    let quoteIndex = self.quoteIndex(section: sectionIndex, quote: quote)
                                    self.userData.latinities[sectionIndex].quotes[quoteIndex].expanded.toggle()
                            }
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
