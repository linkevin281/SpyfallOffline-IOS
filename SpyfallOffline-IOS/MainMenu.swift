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
    @State private var playerCount: Double = 0
    
    var body: some View {
        VStack{
            Text("Welcome to Spyfall")
            HStack{
                
                Button(action: {
                    viewState.currentState = "Menu2"
                }) {
                    Text("Join Game")
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
                
                Spacer()
                    .frame(width: 35.0)
                
                Button(action: {
                    self.showPlayerSlider.toggle()
                }) {
                    Text("New Game")
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
            if showPlayerSlider {
                VStack {
                    Slider(value: $playerCount, in: 0...20, step: 1)
                    Text("   " + "\(Int(playerCount))" + "   ")
                        .frame(width: 100)
                    Button(action: {
                        Data.numberOfPlayers = Int(playerCount)
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
                .animation(.easeInOut(duration: 500.0))
            }
            Spacer()
                .frame(height: 30)
            
            Button(action: {
                viewState.currentState = "HowtoPlay"
            }) {
                Text("How to Play")
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
            
            Spacer()
                
        }
        .padding()
    }
}


struct MenuMain_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(viewState: ViewState())
    }
}
