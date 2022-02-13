//
//  LocationsRoles.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import Foundation

// Location and roles attached object
// struct is simpler object to reason
struct Location: Codable {
    var name:String
    var roles: Array<String>
}
