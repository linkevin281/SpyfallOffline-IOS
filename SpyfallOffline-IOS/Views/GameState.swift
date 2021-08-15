//
//  GameState.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import SwiftUI

struct GameState: View {
    
    @StateObject var viewState: ViewState
    @State var players: Array<Player> = GameData.playerList
    @State var showPlayer: Player = Player(name: "null", role: "null")
    
    var body: some View {
        if (showPlayer.name == "null" && showPlayer.name == "null") {
            ScrollView {
                ForEach(players, id: \.name) { player in
                    Button(action: {
                        showPlayer = Player(name: player.name, role: player.role)
                    }) {
                        Text("\(player.name)")
                            .fontWeight(.bold)
                            .foregroundColor(.black
                            )
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 5)
                                    .frame(width: 300)
                            )
                    }
                    .frame(width: 500.0)
                }
                Button(action: {
                    viewState.currentState = "MainMenu"
                }) {
                    Text("MainMenu")
                        .fontWeight(.bold)
                        .foregroundColor(.black
                        )
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 5)
                                .padding(.horizontal)
                                .frame(width: 180.0, height: 50.0)
                        )
                }
                .frame(width: 143.0)
                
                Button(action: {
                    print(GameData.playerList)
                }) {
                    Text("players")
                        .fontWeight(.bold)
                        .foregroundColor(.black
                        )
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 5)
                                .padding(.horizontal)
                                .frame(width: 180.0, height: 50.0)
                        )
                }
                .frame(width: 143.0)
            }
        }
        else {
            if (showPlayer.role != "You are the Spy!") {
                Text("Location: \(GameData.locations[GameData.location].name)")
            }
            Text("Role: \(showPlayer.role)")
            Button(action: {
                showPlayer = Player(name: "null", role: "null")
            }) {
                Text("Go Back")
                    .fontWeight(.bold)
                    .foregroundColor(.black
                    )
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 5)
                            .padding(.horizontal)
                            .frame(width: 180.0, height: 50.0)
                    )
            }
            .frame(width: 143.0)
        }
    }
}

struct GameState_Previews: PreviewProvider {
    static var previews: some View {
        GameState(viewState: ViewState())
    }
}
