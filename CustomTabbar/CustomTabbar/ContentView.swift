//
//  ContentView.swift
//  CustomTabbar
//
//  Created by shehan karunarathna on 2022-05-01.
//

import SwiftUI

struct ContentView: View {
  init(){
    UITabBar.appearance().isHidden = true
  }
  @State var tab :Tab = .bookmark
    var body: some View {
      VStack(spacing:0){
        TabView(selection: $tab) {
          Text("Bookmark")
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(Color.blue)
            .tag(Tab.bookmark)
          Text("Time").tag(Tab.time)
          Text("Camera").tag(Tab.camera)
          Text("Chat").tag(Tab.chat)
          Text("Settings").tag(Tab.settings)
        }
        CustomTabbar(currentTab: $tab)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
