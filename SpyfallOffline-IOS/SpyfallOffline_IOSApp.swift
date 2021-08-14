//
//  SpyfallOffline_IOSApp.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/11/21.
//

import SwiftUI

@main
struct SpyfallOffline_IOSApp: App {
    
    @StateObject var viewState = ViewState()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewState: viewState)
        }
    }
}
