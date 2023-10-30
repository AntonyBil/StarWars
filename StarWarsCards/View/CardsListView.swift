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
                    LazyVStack {
                        NavigationLink {
                            DetailView(card: card)
                        } label: {
                            Text(card.name.capitalized)
                                .font(.title2)
                        }
                    }
            
                    .task {
                        await
                        cardsVM.loadNextIfNeeded(card:card)
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
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Load All") {
                        Task {
                            await
                            cardsVM.loadAll()
                        }
                    }
                }
                ToolbarItem(placement: .status) {
                    Text("\(cardsVM.cardsArray.count) Cards Returned")
                    
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
