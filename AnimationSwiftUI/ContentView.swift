//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by Екатерина Боровкова on 13.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shape = false
    
    var body: some View {
        
        TabView {
            HeartView(width: 280, height: 280)
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                    Text ("heart")
                }
            StarView(width: 200, height: 280)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text ("star")
                }
            CustomCapsule()
                .tabItem {
                    Image(systemName: "capsule.portrait.fill")
                    Text ("capsule")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
