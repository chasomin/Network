//
//  Beer.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import Foundation

struct Beer: Codable {
    let name: String?
    let image_url: String?
    let description: String?
    let abv: Double?
    let food_pairing: [String]?
    let tagline: String
    
    var alc: String {
        return "Alc.\(abv ?? 0)%"
    }
    
    var food: String {
        return food_pairing?.joined(separator: "\n") ?? ""
    }
}
