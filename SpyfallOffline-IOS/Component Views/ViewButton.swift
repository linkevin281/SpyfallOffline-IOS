//
//  ViewButton.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/16/21.
//

import SwiftUI

// Component view button
struct ViewButton: View {
    @StateObject var viewState: ViewState
    @State var nextState: String
    @State var text: String
    @State var size: Int
    
    var body: some View {
        Button(action: {
            viewState.currentState = nextState
        }) {
            Text(text)
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
    }
}

struct ViewButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewButton(viewState: ViewState(), nextState: "test", text: "test", size: 10)
    }
}
