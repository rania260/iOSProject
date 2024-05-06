//
//  HomeView.swift
//  ProjetIos
//
//  Created by azertt on 3/5/2024.
//

import SwiftUI
import Firebase
struct HomeView: View {
    @State var games = [Game]()
    var body: some View {
        NavigationView {
            List(games) { game in
                NavigationLink(destination: GameDetailsView(game: game)) {
                    HStack(spacing: 30) {
                        AsyncImage(url: URL(string: game.thumb) ?? URL(string: "https://loremflickr.com/640/360")!) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 100, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text("\(game.title)").bold().lineLimit(1)
                            Text("Originally: \(game.normalPrice)$")
                            Text("Discounted: \(game.salePrice)$").foregroundColor(.red)
                            Text("Rating: \(game.steamRatingPercent)%")
                        }
                    }
                }
            }.onAppear() {
                GamesApi().loadData(url: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=55") { games in
                    self.games = games
                }
            }
            .listStyle(.plain)
            .navigationTitle("Steam Games")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        UserHelper.logoutUser()
                        UserHelper.navigateToLogin()
                    }) {
                        Text("Logout")
                    }
                }
            }
        }
    }
    
    var content: some View {
        Text("hi")
    }
}

#Preview {
    HomeView()
}
