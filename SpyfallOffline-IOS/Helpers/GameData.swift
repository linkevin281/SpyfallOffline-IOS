//
//  GameData.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import Foundation

class GameData {
    static var numberOfPlayers: Int = 0
    static var names: Array<String> = []
    static var playerList: Array<Player> = []
    static var locationDict: Dictionary<String,Array<String>> = [:]
    static var locations: Array<Location> = []
    
    
    func makePlayerList(list: Array<String> ) {
        for name in list {
            GameData.playerList.append(Player(name: name, role: "null"))
        }
    }
    
    func assignRoles(location: String) {

    }
    
    class func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Locations.self, from: json) {
            GameData.locations = jsonPetitions.locations
        }
    }
}
