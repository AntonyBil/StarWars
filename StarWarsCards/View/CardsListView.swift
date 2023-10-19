//
//  CardsListView.swift
//  StarWarsCards
//
//  Created by apple on 19.10.2023.
//

import SwiftUI

struct CardsListView: View {
    
    @StateObject private var cardsVM = CardsViewModel()
    
    var body: some View {
        NavigationStack{
            List(cardsVM.cardsArray,id: \.self, rowContent: { card in
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
