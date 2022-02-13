//
//  ViewState.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/13/21.
//

import Foundation

// stores current view state, allows ContentView.swift route views
class ViewState: ObservableObject {
    
    @Published var currentState: String = ""
    
}
