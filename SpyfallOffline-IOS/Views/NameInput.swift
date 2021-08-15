//
//  NameInput.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/13/21.
//

import SwiftUI

struct NameInput: View {
    @StateObject var viewState: ViewState
    
    @State var names: [String] = [""]
    @State var playerCount = 0
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer().frame(width: 10)
                Button(action:{
                    viewState.currentState = "MainMenu"
                }) {
                    Text("Go Back")
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
                Spacer()
            }
            ForEach(0..<names.count, id: \.self) { index in
                TextField("Player \(index+1)", text: Binding(
                            get: { names[index]},
                            set: { names[index] = $0 }))
                    .foregroundColor(.black
                    )
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
//            ForEach(0...playerCount, id: \.self) { index in
//                TextField("Player \(index+1)", text: self.$names[index])
//                    .foregroundColor(.black
//                    )
//                    .padding(.vertical, 20)
//                    .padding(.horizontal, 60)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(Color.gray, lineWidth: 5)
//                            .padding(.horizontal)
//                            .frame(width: 350, height: 50.0)
//                    )
//            }

            HStack {
                Button(action:{
                    if (playerCount >= 1) {
                        self.names.removeLast()
                        self.playerCount -= 1
                    }
                }) {
                    Text("Delete Last")
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
                Button(action:{
                    self.names.append("")
                    self.playerCount += 1
                }) {
                    Text("Add more")
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
            }
            Button(action: {
                viewState.currentState = "GameState"
                if let fileLocation = Bundle.main.url(forResource: "spyfall1", withExtension: "json") {
                    if let data = try? Data(contentsOf: fileLocation) {
                        GameData.parse(json: data)
                    }
                }
                GameData.makePlayerList(list: names)
                GameData.assignRolesLocation()
                
            }) {
                Text("Start Game")
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
    }
}

struct NameInput_Previews: PreviewProvider {
    static var previews: some View {
        NameInput(viewState: ViewState())
    }
}
