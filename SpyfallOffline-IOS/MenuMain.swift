//
//  MenuMain.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/11/21.
//

import SwiftUI

struct MenuMain: View {
    var body: some View {
        VStack{
            Text("Welcome to Spyfall")
            HStack{
                Button(action: {
                    print("tappe")
                }) {
                    Text("Join Game")
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
                Spacer()
                    .frame(width: 32.0)
                Button(action: {
                    print("tappe")
                }) {
                    Text("New Game")
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
            Spacer()
                
        }
    }
}

struct MenuMain_Previews: PreviewProvider {
    static var previews: some View {
        MenuMain()
    }
}
