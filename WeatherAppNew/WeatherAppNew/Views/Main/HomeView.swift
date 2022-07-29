//
//  HomeView.swift
//  WeatherAppNew
//
//  Created by shehan karunarathna on 2022-07-24.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition : CGFloat, CaseIterable{
  case top = 0.73
  case middle = 0.385
}

struct HomeView: View {
  @State var bottomSheetPosition:BottomSheetPosition = .middle
  @State var bottomSheetTranslation : CGFloat = BottomSheetPosition.middle.rawValue
  @State var hasDragged : Bool =  false
  var bottomSheetTranslationProrated : CGFloat  {
    (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) /
    (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
  }
    var body: some View {
      NavigationView {
        GeometryReader { proxy in
          let screenHeight =  proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom

          let offsetImage = screenHeight + 36
          ZStack{
            Color.background.ignoresSafeArea()
            Image("Background")
              .resizable()
              .ignoresSafeArea()
              .offset(y : -bottomSheetTranslationProrated * offsetImage)
            Image("House")
              .frame(maxHeight:.infinity, alignment: .top)
              .padding(.top, 257)
              .offset(y : -bottomSheetTranslationProrated * offsetImage)

            VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)){
              Text("Montreal")
                .font(.largeTitle)
              VStack{
    //            Text("19°")
    //              .font(.system(size: 96, weight: .thin))
    //              .foregroundColor(.primary)
    //            +
    //            Text("\n ")
    //            +
    //            Text("Mostly clear")
    //              .font(.title3.weight(.semibold))
    //              .foregroundColor(.secondary)
                Text(attibuteString)
                Text("H:24 L:18")
                  .font(.title3.weight(.semibold))
                  .opacity(1 - bottomSheetTranslationProrated)

              }
            }
            .foregroundColor(.white)
            .frame(maxHeight:.infinity, alignment: .top)
            .padding(.top, 50)
            .offset(y : -bottomSheetTranslationProrated * 30)
            BottomSheetView(position: $bottomSheetPosition) {
//              Text(bottomSheetTranslationProrated.formatted())
            } content: {
              ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
            }
            .onBottomSheetDrag { translation in
                bottomSheetTranslation = translation / screenHeight
              withAnimation(.easeInOut) {
                if(bottomSheetTranslation == BottomSheetPosition.top.rawValue){
                  hasDragged = true
                } else{
                  hasDragged = false
                }
              }

            }

            TabBar(action: {
              bottomSheetPosition = .top
            })
            .offset(y : bottomSheetTranslationProrated * 115)

          }
          .navigationBarHidden(true)
        .ignoresSafeArea()
        }
      }
    }
  private var attibuteString : AttributedString{
    var string = AttributedString("19°" + (hasDragged ? " | " : "\n") +  "Mostly Clear")
    if let temp = string.range(of: "19°"){
      string[temp].font = .system(size: 96 - (bottomSheetTranslationProrated * (96 - 20)), weight: hasDragged ? .semibold : .thin)
      string[temp].foregroundColor = .white

    }
    if let pipe = string.range(of: " | "){
      string[pipe].font = .title3.weight(.semibold)
      string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
    }
    if let weather = string.range(of: "Mostly Clear"){
      string[weather].font = .title3.weight(.semibold)
      string[weather].foregroundColor = .white
    }
    return string
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
