//
//  DetailView.swift
//  StarWarsCards
//
//  Created by apple on 23.10.2023.
//

import SwiftUI

struct DetailView: View {
    var card: Card
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(card.name.capitalized)
                .font(.largeTitle)
                .bold()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Rectangle()
                .frame(height: 2)
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
            
            Group {
                HStack(alignment: .top){
                    Text("Classification:")
                        .bold()
                    Text(card.classification)
                }
                HStack(alignment: .top){
                    Text("Designation:")
                        .bold()
                    Text(card.designation)
                }
                HStack(alignment: .top){
                    Text("Average height:")
                        .bold()
                    Text(card.average_height)
                    Spacer()
                    Text("Lifespan:")
                        .bold()
                    Text(card.average_lifespan)
                }
                HStack(alignment: .top){
                    Text("Language:")
                        .bold()
                    Text(card.language)
                }
                HStack(alignment: .top){
                    Text("Skin colors:")
                        .bold()
                    Text(card.skin_colors)
                }
                HStack(alignment: .top){
                    Text("Hair colors:")
                        .bold()
                    Text(card.hair_colors)
                }
                HStack(alignment: .top){
                    Text("Eye colors:")
                        .bold()
                    Text(card.eye_colors)
                }
                
            }
            .font(.title2)
            
            VStack {
                AsyncImage(url: URL(string: returnCardUrl())) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 15)
                        .animation(.default, value: image)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 15)
                }
            }
            .frame(maxWidth: .infinity)
            
            
            Spacer()
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func returnCardUrl() -> String {
        var newName = card.name.replacingOccurrences(of: " ", with: "-")
        newName = newName.replacingOccurrences(of: "'", with: "")
        return "https://gallaugher.com/wp-content/uploads/2023/04/\(newName).jpg"
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(card: Card(name: "Antony", classification: "Human", designation: "Coding", average_height: "186", average_lifespan: "36", language: "Swift", skin_colors: "various", hair_colors: "various", eye_colors: "blue, green, brown, black, hzel, grey"))
    }
}

//https://gallaugher.com/wp-content/uploads/2023/04/name.jpeg
