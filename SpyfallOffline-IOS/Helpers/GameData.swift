//
//  GameData.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import Foundation

class GameData {
    static var numberOfPlayers: Int = 0
    static var playerList: Array<Player> = []
    static var locations: Array<Location> = []
    static var location: Int = 0
    
    
    class func makePlayerList(list: Array<String> ) {
        for name in list {
            GameData.playerList.append(Player(name: name, role: "null"))
        }
    }
    
    class func assignRolesLocation() {
        GameData.location = Int.random(in: 0..<GameData.locations.count)
        
        for player in GameData.playerList {
            player.role = GameData.locations[GameData.location].roles[Int.random(in: 1..<GameData.locations[GameData.location].roles.count)]
        }
        
        GameData.playerList[Int.random(in: 0..<GameData.playerList.count)].role = "You are the Spy!"
    }
    
    class func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Locations.self, from: json) {
            GameData.locations = jsonPetitions.locations
        }
    }
}
