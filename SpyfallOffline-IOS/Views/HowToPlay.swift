//
//  HowToPlay.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/13/21.
//

import SwiftUI


// View to show how to play
struct HowToPlay: View {
    
    @StateObject var viewState: ViewState
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            Spacer()
                .frame(height: 40)
            Text("How to Play Spyfall")
                .font(Font.custom("Raleway", size: 32))
            Divider()
                .frame(height: 30)
            VStack {
                Text("The easiest way to learn how to play Spyfall would be to watch someone else play, as it will help you get a feel for the dynamic of the game. Here's a video on YouTube of some people playing:").padding(.bottom)
                YoutubeEmbed(videoID: "O7W0rH6YpeI").frame(height: 200)
                Text("When the game begins, one random player will become the ") +
                Text("spy").foregroundColor(Color.red) +
                Text(", and all others will be given a location, and a role within the location. For example, if the location of a round was 'restaurant,' one player might be the chef, another the waiter, another the customer, etc.")
                Text("The players will not know who the spy is, and the spy will not know the location.").padding()
            }.fixedSize(horizontal: false, vertical: true)
            VStack {
                Text("Players take turns asking questions to each other, doing their best not to outright reveal the location in their questions and answers, but not being too vague as to raise suspicion.")
                Text("The non-spy group of players wins if they unanimously agree on the identity of the spy player.").padding().fixedSize(horizontal: false, vertical: true)
                Text("The spy wins if they figure out the location, which they have one chance to yell out at any time during the round. The spy also wins if the other players unanimously accuse someone else, or cannot unanimously decide on someone to accuse.")
            }.fixedSize(horizontal: false, vertical: true)
            Spacer()
                .frame(height: 20)
            ViewButton(viewState: viewState, nextState: "MainMenu", text: "Go Back", size: 10)
            Spacer()
                .frame(height: 25)
        }
        .padding()
        .multilineTextAlignment(.center)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .font(Font.custom("Raleway", size: 16))
    }
}


struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay(viewState: ViewState())
    }
}
