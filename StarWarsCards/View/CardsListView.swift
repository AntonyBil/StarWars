//
//  CardsListView.swift
//  StarWarsCards
//
//  Created by apple on 19.10.2023.
//

import SwiftUI

struct CardsListView: View {
    @State private var speciesArray = ["Hutt", "Ewok", "Wookiee", "Droid", "Human"]
    var body: some View {
        NavigationStack{
            List(speciesArray, id: \.self, rowContent: { card in
                Text(card)
            })
            .listStyle(.plain)
            .font(.title)
            .navigationTitle("Cards")
            
        }
        
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
