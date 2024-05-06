//
//  GamesApi.swift
//  ProjetIos
//
//  Created by azertt on 6/5/2024.
//

import Foundation

class GamesApi {
    
    func loadData(url: String, completion:@escaping ([Game]) -> ()) {
        guard let url = URL(string: url) else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let games = try! JSONDecoder().decode([Game].self, from: data!)
            print(games)
            DispatchQueue.main.async {
                completion(games)
            }
        }.resume()
    }
}
