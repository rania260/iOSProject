//
//  Games.swift
//  ProjetIos
//
//  Created by azertt on 6/5/2024.
//

import Foundation

struct Game: Codable, Identifiable {
    let id = UUID()
    var title: String
    var normalPrice: String
    var salePrice: String
    var steamRatingPercent: String
    var thumb: String
}
