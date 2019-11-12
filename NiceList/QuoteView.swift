//
//  QuoteView.swift
//  NiceList
//


import SwiftUI

struct QuoteView: View {
    
    var quote : QuoteDataModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(quote.latin)
                .font(.title)
            if quote.expanded {
                Group() {
                    Divider()
                    Text(quote.russian).font(.body)
                }
            }
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: UserData().latinities[0].quotes[0])
    }
}
