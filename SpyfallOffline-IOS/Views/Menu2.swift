//
//  Menu2.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/13/21.
//

import SwiftUI


struct Menu2: View {
    
    @StateObject var viewState: ViewState
    
    var body: some View {
        Button(action: {
            viewState.currentState = "MainMenu"
        }) {
            Text("Join Game")
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
        .frame(width: 143.0)
    }
}

struct Menu2_Previews: PreviewProvider {
    static var previews: some View {
        Menu2(viewState: ViewState())
    }
}
