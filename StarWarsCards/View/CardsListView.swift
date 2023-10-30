//
//  CardsListView.swift
//  StarWarsCards
//
//  Created by apple on 19.10.2023.
//

import SwiftUI
import AVFAudio

struct CardsListView: View {
    
    @StateObject private var cardsVM = CardsViewModel()
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSound = -1
    
    
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
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        var nextSound: Int
                        repeat {
                            nextSound = Int.random(in: 0...8)
                        }while nextSound == lastSound
                        lastSound = nextSound
                        playSound(soundName: "\(lastSound)")
                    } label: {
                        Image("peek")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                    }

                }
            }
            
            
            
            
            
        }
        .task {
            await cardsVM.getData()
        }
        
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Culd not reed file name \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
