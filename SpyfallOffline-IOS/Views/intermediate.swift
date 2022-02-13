//
//  intermediate.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/14/21.
//

import SwiftUI


// deprecated test view
struct intermediate: View {
    @StateObject var viewState: ViewState
    
    var body: some View {
        Text("h")
    }
}

struct intermediate_Previews: PreviewProvider {
    static var previews: some View {
        intermediate(viewState: ViewState())
    }
}
