//
//  GameDetailsView.swift
//  ProjetIos
//
//  Created by azertt on 6/5/2024.
//

import SwiftUI

struct GameDetailsView: View {
    let game: Game
    let imageSize: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: game.thumb)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame( height: imageSize)
                            .clipped()
                        
                    } else if phase.error != nil {
                        
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 15) {
        
                    Text(game.title)
                        .font(.headline)
                    Text(game.normalPrice)
                        .font(.footnote)
                    Text(game.salePrice)
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


#Preview {
    GameDetailsView(game:
                        Game(
                            title: "Mario",
                            normalPrice: "11$",
                            salePrice: "5$",
                            steamRatingPercent: "20%",
                            thumb: "image")
    )
}
