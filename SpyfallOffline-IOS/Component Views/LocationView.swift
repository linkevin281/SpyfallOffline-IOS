//
//  LocationView.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/18/21.
//

import SwiftUI


// Location view component
struct LocationView: View {
    @State var locations: Array<Location> = GameData.locations
    @StateObject var viewState: ViewState
    @State var inGame: Bool
    
    var body: some View {
        if (GameData.timerWorking) {
            Text("").onReceive(GameData.timer, perform: { _ in
                if GameData.timeRemaining > 0 {
                    GameData.timeRemaining -= 1
                }
            })
        }
        ScrollView(showsIndicators: false) {
            VStack {
                Spacer()
                    .frame(height: 40)
                VStack {
                    Text("\(GameData.locationSet) Location Set Selected").font(Font.custom("Raleway", size: 32)).multilineTextAlignment(.center).padding(.bottom, 1)
                    Divider().padding(.top, 15.0).padding(.horizontal, 15).padding(.bottom, 25)
                }
                HStack{
                    VStack{
                        ForEach(0..<locations.count/2, id:\.self) {index in
                            LocationBox(name: locations[index].name as NSString)
                                .padding(.bottom, 7)
                        }
                    }
                    Spacer().frame(width: 61)
                    VStack{
                        ForEach(locations.count/2..<locations.count, id:\.self) {index in
                            LocationBox(name: locations[index].name as NSString)
                                .padding(.bottom, 7)
                        }
                    }
                }
                VStack {
                    Divider().padding(.vertical, 15.0).padding(.horizontal, 15)
                }
                Button(action: {
                    if (inGame) {
                        viewState.currentState = "GameState"
                    }
                    else {
                        viewState.currentState = "MainMenu"
                    }
                }) {
                    Text("Go Back")
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

            }
        }
        .padding()
        .ignoresSafeArea()
        .font(Font.custom("Raleway", size: 15)).multilineTextAlignment(.center)
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        Text("a")
    }
}


