//
//  Data.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import Foundation

class Data {
    static var numberOfPlayers: Int = 0
    static var names: Array<String> = []
    static var playerList: Array<Player> = []
    static var locationDict: Dictionary<String,Array<String>> = [:]
    
    func makePlayerList(list: Array<String> ) {
        for name in list {
            Data.playerList.append(Player(name: name, role: "null"))
        }
    }
    
    func assignRoles(location: String) {
        let roleList = Data.locationDict[location]
        for player in Data.playerList {
            player.role = roleList![Int.random(in: 1..<roleList!.count)]
        }
    }
}
