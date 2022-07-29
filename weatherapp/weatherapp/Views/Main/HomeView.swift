//
//  HomeView.swift
//  weatherapp
//
//  Created by shehan karunarathna on 2022-07-02.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition : CGFloat, CaseIterable{
  case top = 0.83
  case middle = 0.385
}

struct HomeView: View {
  @State var bottomSheetPostion : BottomSheetPosition = .middle
    var body: some View {
      NavigationView {
        ZStack{
          Color.background
            .ignoresSafeArea()
          Image("Background")
            .resizable()
            .ignoresSafeArea()
          Image("House")
            .frame(maxHeight:.infinity, alignment: .top)
            .padding(.top, 257)
          VStack{
            Text("Monteral")
              .font(.largeTitle)
            VStack{
              Text(attributeString)
  //            Text("19°")
  //              .font(.system(size: 96, weight: .thin))
  //              .foregroundColor(.primary)
  //            +
  //            Text("\n ")
  //            +
  //            Text("Mostly Clear")
  //              .font(.title3)
  //              .fontWeight(.semibold)
  //              .foregroundColor(.secondary)
              Text("H:24°  L:18°" )
                .font(.title3)
                .fontWeight(.semibold)
            }
            Spacer()
          }
          .padding(.top, 52)
          BottomSheetView(position: $bottomSheetPostion) {

          } content: {
            ForecaseView()
          }

          Tabbar(action: {
            bottomSheetPostion = .top
          })
        }
        .navigationBarHidden(true)
      }
    }
  private var attributeString:AttributedString{
    var string = AttributedString("19°" + "\n " + "Mostly Clear")
    if let temp = string.range(of: "19°") {
      string[temp].font = .system(size: 96, weight:.thin)
      string[temp].foregroundColor = .primary
    }
    if let pipe = string.range(of: "|") {
      string[pipe].font = .title3.weight(.semibold)
      string[pipe].foregroundColor = .secondary
    }

    if let weather = string.range(of: "Mostly Clear") {
      string[weather].font = .title3.weight(.semibold)
      string[weather].foregroundColor = .secondary
    }

    return string
  }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        .preferredColorScheme(.dark)
    }
}
