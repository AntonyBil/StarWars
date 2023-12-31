//
//  CardsViewModel.swift
//  StarWarsCards
//
//  Created by apple on 19.10.2023.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    
    struct Returned: Codable {
        var next: String?
        var results: [Card]
    }
    
    @Published var cardsArray: [Card] = []
    @Published var isLoading = false
    var urlString = "https://swapi.dev/api/species/"
    
    func getData() async {
        print("🕸 We are accessing the url \(urlString)")
        isLoading = true
        
        guard let url = URL(string: urlString) else {
            print("🚫ERROR: Could not create a URL from \(urlString)")
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("🚫 JSON ERROR: Could not decode returned JSON data")
                isLoading = false
                return
            }
            self.urlString = returned.next ?? ""
            self.cardsArray = self.cardsArray + returned.results
            isLoading = false
            
        } catch {
            isLoading = false
            print("🚫 ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
    
    func loadNextIfNeeded(card: Card) async {
        guard let lastCard = cardsArray.last else {
            return
        }
        
        if card.id == lastCard.id && urlString.hasPrefix("http") {
            Task{
                await getData()
            }
        }
    }
    
    func loadAll() async {
        guard urlString.hasPrefix("http") else { return }
        
        await getData()
        await loadAll()
    }
    
    
}
