//
//  GameState.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import SwiftUI


// In game view
struct GameState: View {
    
    @StateObject var viewState: ViewState
    @State var players: Array<Player> = GameData.playerList
    @State var showPlayer: Player = Player(name: "null", role: "null")
    @State var timerWorking = GameData.timerWorking
    @State var timeRemaining = GameData.timeRemaining
    
    var body: some View {
        
        // if timer is on then have timer ticking
        if (GameData.timerWorking) {
            Text("").onReceive(GameData.timer, perform: { _ in
                if GameData.timeRemaining > 0 {
                    GameData.timeRemaining -= 1
                }
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            })
        }
        
        // show this if single player is not selected
        if (showPlayer.name == "null" && showPlayer.name == "null") {
            ScrollView {
                VStack {
                    HStack {
                        
                        // timer zstack where red and blue are overlayed
                        // red is paused, blue is working
                        ZStack{
                            Button(action: {
                                timerWorking.toggle()
                                GameData.timerWorking.toggle()
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
                    
                    // Button to view current location set
                    Button(action: {
                        viewState.currentState = "LocationInGame"
                    }) {
                        Text("Location Set: \(GameData.locationSet)").font(Font.custom("Raleway", size: 16)).foregroundColor(.black).padding(.top, 5)
                    }
                    Divider().padding(.top, 15.0).padding(.horizontal, 15)
                }.padding()
                
                // For each player, create a player button that shows them player info
                ForEach(players, id: \.name) { player in
                    Button(action: {
                        showPlayer = Player(name: player.name, role: player.role)
                        // set show player info
                    }) {
                        Text("\(player.name)")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 5)
                                    .padding(.horizontal)
                                    .frame(width: 180.0, height: 50.0)
                            )
                    }
                    .frame(width: 180.0).padding(.top, 15)
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
                        GameData.assignRolesLocation()
                        timeRemaining = 480
                        timerWorking = false
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
                
            }.font(Font.custom("Raleway", size: 16))
        }
        
        // if someone clicks a player, display player info
        else {
            VStack {
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
            }.font(Font.custom("Raleway", size: 16))
        }
    }
}

struct GameState_Previews: PreviewProvider {
    static var previews: some View {
        GameState(viewState: ViewState())
    }
}
