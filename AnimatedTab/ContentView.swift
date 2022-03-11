//
//  ContentView.swift
//  AnimatedTab
//
//  Created by shehan karunarathna on 2022-03-11.
//

import SwiftUI


struct ContentView: View {
  let tabList: [String] = ["home", "heart", "dumbbell", "camera"]
  @State private var selectedTabBar = "home"
  @State public var xOffSet: CGFloat = 0
  init() { UITabBar.appearance().isHidden = true }

    var body: some View {
      ZStack (alignment: Alignment(horizontal: .center,
                                   vertical: .bottom)) {
          TabView(selection: $selectedTabBar) {
              if selectedTabBar == tabList[0] {
                  Color.blue.ignoresSafeArea()
              } else if selectedTabBar == tabList[1] {
                  Color.red.ignoresSafeArea()
              } else if selectedTabBar == tabList[2] {
                  Color.orange.ignoresSafeArea()
              } else {
                  Color.green.ignoresSafeArea()
              }
          }

          HStack() {
              ForEach(tabList,id: \.self) { image in
                  GeometryReader { reader in
                      TabbarButton(image: image, selectedTabBar:
                      selectedTabBar, reader: reader) {
                          withAnimation(Animation.linear(duration: 0.3)) {
                              selectedTabBar = image
                              xOffSet = reader.frame(in: .global).minX
                          }
                      }
                      .onAppear(perform: {
                          if image == tabList.first {
                              xOffSet = reader.frame(in: .global).minX
                          }
                      })
                  }.frame(width: 30, height: 30)
                  if image != tabList.last { Spacer(minLength: 0) }
              }
          }
          .padding(.horizontal, 25).padding(.vertical)
          .background(Color.white.clipShape(CustomShape(xOffSet: xOffSet)).cornerRadius(10))
          .padding(.horizontal)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabbarButton: View {
    public var image: String
    public var selectedTabBar: String
    public var reader: GeometryProxy
    public var xOffSet: CGFloat = 0
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(selectedTabBar == image ? Color.red : Color.gray)
                .padding(selectedTabBar == image ? 15 : 0)
                .background(Color.white.opacity(selectedTabBar == image ? 1 : 0)
                .clipShape(Circle()))
                .offset(x: selectedTabBar == image ? (reader.frame(in: .global).minX-reader.frame(in: .global).midX) : 0, y: selectedTabBar == image ? -50 : 0)
        }
    }
}
