//
//  LocationBox.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/20/21.
//

import SwiftUI


struct LocationBox: View {
    @State var name: NSString
    
    var body: some View {
        ZStack{
            Text(name.capitalized)
                .background(Rectangle()
                        .frame(width: 180, height: 30)
                                .foregroundColor(Color(white: 0.7745)))
        }.font(Font.custom("Raleway", size: 15))
    }
}

struct LocationBox_Previews: PreviewProvider {
    static var previews: some View {
        LocationBox(name: "airplane string")
    }
}
