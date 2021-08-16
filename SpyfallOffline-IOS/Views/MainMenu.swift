//
//  MainMenu.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/11/21.
//

import SwiftUI

struct MainMenu: View {
    
    @StateObject var viewState: ViewState
    @State private var showPlayerSlider = false
    @State private var showLocationOptions = false
    @State private var playerCount: Double = 0
    var body: some View {
        ScrollView{
            VStack {
                Text("Welcome to Offline Spyfall").font(Font.custom("Raleway", size: 32)).multilineTextAlignment(.center).padding(.bottom, 1)
                HStack {
                    Link("(Adapted from spyfall.tannerkrewson.com)", destination: URL(string: "https://spyfall.tannerkrewson.com/")!)
                }.foregroundColor(.gray)
                Divider().padding(.vertical, 15.0).padding(.horizontal, 15)
                
                VStack {
                    Text("Spyfall is based off of the board game designed by Alexandr Ushan. You'll need at least 3 players, but the game is best played with 4-6 players")
                }
            }
            VStack {
                HStack{
                    Button(action: {
                        self.showPlayerSlider.toggle()
                    }) {
                        Text("New Game")
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
                    .padding(.top, 13)
                    
                }
                if showPlayerSlider {
                    VStack {
                        Slider(value: $playerCount, in: 0...20, step: 1)
                        Text("\(Int(playerCount))" + " Players")
                            .frame(width: 100)
                        Button(action: {
                            GameData.numberOfPlayers = Int(playerCount)
                            viewState.currentState = "NameInput"
                        }) {
                            Text("Continue")
                                .foregroundColor(.black
                                )
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 5)
                                        .padding(.horizontal)
                                        .frame(width: 108.0, height: 30.0)
                                )
                        }
                        .frame(width: 143.0)
                    }
                    .padding(.horizontal, 30.0)
                    .padding(.top, 10)
                    .animation(.easeIn(duration: 2))
                }
                Button(action: {
                    showLocationOptions.toggle()
                }) {
                    Text("Locations")
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
                .padding(.top)
                if showLocationOptions {
                    HStack {
                        ViewButton(viewState: viewState, nextState: "", text: "Set 1", size: 5)
                        ViewButton(viewState: viewState, nextState: "", text: "Set 2", size: 5)
                        ViewButton(viewState: viewState, nextState: "", text: "Set 3", size: 5)
                 
                    }
                }
                Button(action: {
                    viewState.currentState = "Leaderboard"
                }) {
                    Text("Leaderboards")
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
                .padding(.top)
                Button(action: {
                    viewState.currentState = "HowtoPlay"
                }) {
                    Text("How to Play")
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
                .padding(.top)
            }
            VStack {
                Divider().padding(20)
                Button(action: {
                    
                }) {
                    Text("Go Dark")
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
                
                Link("View on GitHub", destination: URL(string: "https://github.com/linkevin281/SpyfallOffline-IOS")!).padding()
            }
            
            Spacer()
        }
        .padding()
        .font(Font.custom("Raleway", size: 15)).multilineTextAlignment(.center)
    }
}


struct MenuMain_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(viewState: ViewState())
    }
}
