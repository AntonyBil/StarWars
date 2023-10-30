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
            ZStack {
                List(cardsVM.cardsArray) { card in
                    NavigationLink {
                        DetailView(card: card)
                    } label: {
                        Text(card.name.capitalized)
                            .font(.title2)
                    }
                }
                .listStyle(.plain)
                .font(.title)
            .navigationTitle("Cards")
                
                if cardsVM.isLoading {
                    ProgressView()
                        .scaleEffect(4)
                        .tint(.green)
                }
                
            }
            
            
            
            
        }
        .task {
            await cardsVM.getData()
        }
        
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
