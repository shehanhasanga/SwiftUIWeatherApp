//
//  Home.swift
//  ResposeUI
//
//  Created by shehan karunarathna on 2022-06-25.
//

import SwiftUI

struct Home: View {
  @State var currentMenu : String = "Inbox"
  @State var showMenu : Bool = false
    var body: some View {
      ResposibleView { properties in

        HStack(spacing:0){
          if properties.isLandscape {
            Sidebar(currentMenu:$currentMenu, prop: properties)
          }
          MainView(prop: properties)

        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .overlay{
            ZStack(alignment: .leading) {
              if(!properties.isLandscape){

                Color.black
                  .opacity(showMenu ? 0.5 : 0)
                  .ignoresSafeArea()

                Sidebar(currentMenu: $currentMenu, prop: properties)
                  .offset(x: showMenu ? 0 : -300)



              }
            }
          }
      }
    }
  @ViewBuilder
  func MainView (prop: Properties) -> some View{
    VStack(spacing:0){
      HStack(spacing:12){
        Button{
          withAnimation{
            showMenu.toggle()
          }
        }label: {
          Image(systemName: "line.3.horizontal")
            .font(.title3)
            .foregroundColor(.black)


        }
        TextField("Search",text: .constant(""))
        Image(systemName: "magnifyingglass")
      }
      .padding(.horizontal)
      .padding(.vertical, 12)
      .background(
        RoundedRectangle(cornerRadius: 6, style: .continuous)
          .fill(.white)
      )

    }.frame(maxHeight:.infinity, alignment: .top)
  }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
      Home()
        .previewInterfaceOrientation(.portrait)
    }
}
