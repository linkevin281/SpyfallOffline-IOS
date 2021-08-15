//
//  HowToPlay.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/13/21.
//

import SwiftUI

struct HowToPlay: View {
    
    @StateObject var viewState: ViewState
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            Text("How to Play Spyfall")
                .font(.title)
            Divider()
                .frame(height: 30)
            
            VStack {
                Text("Players")
                Spacer()
                    .frame(height: 30)
                HStack {
                    Text("One Spy 4-6")
                    Text("Two Spies 6-8")
                    
                }
            }
            VStack {
                Text("The easiest way to learn how to play Spyfall would be to watch someone else play, as it will help you get a feel for the dynamic of the game. Here's a video on YouTube of some people playing:").padding()
                Text("When the game begins, one random player will become the ") +
                Text("spy").foregroundColor(Color.red) +
                Text(", and all others will be given a location, and a role within the location. For example, if the location of a round was 'restaurant,' one player might be the chef, another the waiter, another the customer, etc.")
                Text("The players will not know who the spy is, and the spy will not know the location.").padding()
            }
            VStack {
                Text("Players take turns asking questions to each other, doing their best not to outright reveal the location in their questions and answers, but not being too vague as to raise suspicion.")
                Text("The non-spy group of players wins if they unanimously agree on the identity of the spy player.").padding()
                Text("The spy wins if they figure out the location, which they have one chance to yell out at any time during the round. The spy also wins if the other players unanimously accuse someone else, or cannot unanimously decide on someone to accuse.")
            }
            Spacer()
            Button(action: {
                viewState.currentState = "MainMenu"
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
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}


struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay(viewState: ViewState())
    }
}
