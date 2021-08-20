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
    static var locationSet: String = "Spyfall 1"
    
    class func initialNameInput() -> Array<String> {
        var tempArray = [String]()
        if numberOfPlayers >= 1 {
            for _ in 1...numberOfPlayers {
                tempArray.append("")
            }
        }
        return tempArray
    }
    
    class func checkEmpty(list: Array<String>) -> Bool {
        var check = false
        for name in list {
            if name != "" {
                check = true
            }
        }
        return check
    }
    
    class func makePlayerList(list: Array<String> ) {
        for name in list {
            if name != "" {
                GameData.playerList.append(Player(name: name, role: "null"))
            }
        }
    }
    
    class func assignRolesLocation() {
        GameData.location = Int.random(in: 0..<GameData.locations.count)
        
        for player in GameData.playerList {
            player.role = GameData.locations[GameData.location].roles[Int.random(in: 1..<GameData.locations[GameData.location].roles.count)]
        }
        
        GameData.playerList[Int.random(in: 0..<GameData.playerList.count)].role = "You are the Spy!"
    }
    
    class func loadLocations() {
        if let fileLocation = Bundle.main.url(forResource: locationSet, withExtension: "json") {
            if let data = try? Data(contentsOf: fileLocation) {
                let decoder = JSONDecoder()

                if let jsonPetitions = try? decoder.decode(Locations.self, from: data) {
                    GameData.locations = jsonPetitions.locations
                }
            }
        }
        
    }
    class func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%2d:%02d", minutes, seconds)
    }
}
