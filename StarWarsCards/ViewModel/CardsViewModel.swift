//
//  CardsViewModel.swift
//  StarWarsCards
//
//  Created by apple on 19.10.2023.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    
    struct Returnd: Codable {
        var next: String?
        var results: [Card]
    }
    
    @Published var cardsArray: [Card] = []
    var urlString = "https://swapi.dev/api/species/"
    
    
}
