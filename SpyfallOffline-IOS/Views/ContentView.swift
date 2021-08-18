//
//  ContentView.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/11/21.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewState: ViewState
    
    var body: some View {
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
        default:
            MainMenu(viewState: viewState)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(viewState: ViewState())
    }
}