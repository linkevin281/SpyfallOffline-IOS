//
//  NameInput.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/13/21.
//

import SwiftUI


// View for inputting player names
struct NameInput: View {
    @StateObject var viewState: ViewState
    @State var names: [String] = GameData.initialNameInput()
    @State var playerCount = GameData.numberOfPlayers

    var body: some View {
        
        // bind whole view in gameview
        ScrollView {
            VStack {
                Text("Enter player names").font(Font.custom("Raleway", size: 32)).multilineTextAlignment(.center).padding(.bottom, 1)
                Divider().padding(.vertical, 15.0).padding(.horizontal, 15)
            }.padding(.top).padding(.horizontal)
            
            // for each player, create a field and use them to set names array
            ForEach(0..<names.count, id: \.self) { index in
                TextField("Player \(index+1)", text: Binding(
                            get: { names[index]},
                            set: { names[index] = $0 }))
                    .foregroundColor(.black)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 5)
                            .padding(.horizontal)
                            .frame(width: 350, height: 50.0)
                    )
            }
            .onDelete{ indexSet in
                names.remove(atOffsets: indexSet)
            }

            
            HStack {
                // delete from end of array, ensure length is at least 1
                Button(action:{
                    if (playerCount >= 1) {
                        self.names.removeLast()
                        self.playerCount -= 1
                    }
                }) {
                    Text("Delete Last")
                        .foregroundColor(.black)
                        .font(Font.custom("Raleway", size: 12))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 5)
                                .padding(.horizontal)
                                .frame(width: 130.0, height: 30.0)
                        )
                }
                Spacer().frame(width: 60)
                
                // add to end of array a new empty player
                Button(action:{
                    self.names.append("")
                    self.playerCount += 1
                }) {
                    Text("Add more")
                        .foregroundColor(.black)
                        .font(Font.custom("Raleway", size: 12))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 5)
                                .padding(.horizontal)
                                .frame(width: 130, height: 30.0)
                        )
                }
            }
            VStack {
                Divider().padding(.vertical, 15.0).padding(.horizontal, 15)
            }.padding()
            HStack {
                Button(action: {
                    viewState.currentState = "MainMenu"
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
                Spacer().frame(width: 25)
                Button(action: {
                    if (GameData.checkEmpty(list: names)) {
                        viewState.currentState = "GameState"
                        GameData.loadLocations()
                        GameData.makePlayerList(list: names)
                        GameData.assignRolesLocation()
                    }

                    
                }) {
                    Text("Start Game")
                        .foregroundColor(.red)
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
        .font(Font.custom("Raleway", size: 16))
    }
}

struct NameInput_Previews: PreviewProvider {
    static var previews: some View {
        NameInput(viewState: ViewState())
    }
}
