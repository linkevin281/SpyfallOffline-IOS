//
//  YoutubeEmbed.swift
//  SpyfallOffline-IOS
//
//  Created by Kevin Lin on 8/16/21.
//

import SwiftUI
import WebKit

// Youtube embed component
struct YoutubeEmbed: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
    
}
