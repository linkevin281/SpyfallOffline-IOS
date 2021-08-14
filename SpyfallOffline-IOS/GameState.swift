//
//  GameState.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import SwiftUI

struct GameState: View {
    
    @StateObject var viewState: ViewState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GameState_Previews: PreviewProvider {
    static var previews: some View {
        GameState(viewState: ViewState())
    }
}
