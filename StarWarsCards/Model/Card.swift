//
//  Card.swift
//  StarWarsCards
//
//  Created by apple on 19.10.2023.
//

import Foundation

struct Card: Identifiable, Codable {
    var id = UUID().uuidString
    var name: String
    var classification: String
    var designation: String
    var average_height: String
    var skin_colors: String
    var heir_colors: String
    var eye_colors: String
    
    enum CodingKeys: CodingKey {
        case name, classification, designation, average_height, skin_colors, heir_colors, eye_colors
    }

}


