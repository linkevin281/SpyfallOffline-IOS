//
//  Player.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/13/21.
//

import Foundation

// Player object
// Class allows for inheritance, type casting 
class Player {
    var name: String
    var role: String
    
    init(name: String, role: String) {
        self.name = name
        self.role = role
    }
}
