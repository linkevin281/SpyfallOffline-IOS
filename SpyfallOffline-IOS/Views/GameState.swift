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
    @State var timeRemaining = 480
    @State var timerWorking = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        if (showPlayer.name == "null" && showPlayer.name == "null") {
            VStack {
                HStack {
                    ZStack{
                        if (timerWorking) {
                            Text("\(GameData.timeString(time: TimeInterval(timeRemaining)))")
                                .foregroundColor(.blue).font(Font.custom("Raleway", size: 32)).onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    }
                                }
                        }
                        Button(action: {
                            timerWorking.toggle()
                        }) {
                            if (!timerWorking) {
                                Text("\(GameData.timeString(time: TimeInterval(timeRemaining)))")
                                    .foregroundColor(.red).font(Font.custom("Raleway", size: 32))
                            }
                            if (timerWorking) {
                                Text("\(GameData.timeString(time: TimeInterval(timeRemaining)))")
                                    .foregroundColor(.blue).font(Font.custom("Raleway", size: 32))
                            }
                            
                        }
                        .frame(width: 143.0)
                        
                    }
                    Spacer().frame(width: 6)
                }
                Text("Tap to Pause").foregroundColor(.gray).font(Font.custom("Raleway", size: 16))
                Divider().padding(.top, 15.0).padding(.horizontal, 15)
            }.padding()
            ScrollView {
                ForEach(players, id: \.name) { player in
                    Button(action: {
                        showPlayer = Player(name: player.name, role: player.role)
                    }) {
                        Text("\(player.name)")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 5)
                                    .frame(width: 300)
                            )
                    }
                    .frame(width: 500.0)
                }
                VStack {
                    Divider().padding(.vertical, 15.0).padding(.horizontal, 15)
                }.padding()
                HStack {
                    Button(action: {
                        viewState.currentState = "MainMenu"
                        GameData.playerList = []
                    }) {
                        Text("Leave Game")
                            .foregroundColor(.blue)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 5)
                                    .padding(.horizontal)
                                    .frame(width: 180.0, height: 50.0)
                            )
                    }
                    .frame(width: 143.0)
                    Spacer().frame(width: 25)
                    Button(action: {

                    }) {
                        Text("Play Again")
                            .foregroundColor(.red)
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
