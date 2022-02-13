//
//  ContentView.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/11/21.
//

import SwiftUI

// View
struct ContentView: View {
    
    @StateObject var viewState: ViewState
    
    var body: some View {
        ZStack {
            switch viewState.currentState {
            case "MainMenu":
                MainMenu(viewState: viewState)
            case "Menu2":
                Menu2(viewState: viewState)
            case "NameInput":
                NameInput(viewState: viewState)
            case "HowtoPlay":
                HowToPlay(viewState: viewState)
            case "intermediate":
                intermediate(viewState: viewState)
            case "GameState":
                GameState(viewState: viewState)
            case "LocationView":
                LocationView(viewState: viewState, inGame: false)
            case "LocationInGame":
                LocationView(viewState: viewState, inGame: true)
            default:
                MainMenu(viewState: viewState)
            }
        }.preferredColorScheme(.light)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(viewState: ViewState())
    }
}
