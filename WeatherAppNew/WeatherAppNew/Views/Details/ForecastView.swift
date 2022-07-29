//
//  ForecastView.swift
//  WeatherAppNew
//
//  Created by shehan karunarathna on 2022-07-24.
//

import SwiftUI

struct ForecastView: View {
  var bottomSheetTranslationProrated : CGFloat = 1
  @State private var selection : Int = 0

    var body: some View {
      ScrollView{
        VStack(spacing:10){
          SegmentedControl(selection: $selection)
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:12){
              if selection == 0 {
                ForEach(Forecast.hourly){
                  forecast in
                  ForecastCard(forecast: forecast, forecastPeriod: ForecastPeriod.hourly)
                }
                .transition(.offset(x:-430))
              } else {
                ForEach(Forecast.daily){
                  forecast in
                  ForecastCard(forecast: forecast, forecastPeriod: ForecastPeriod.daily)
                }
                .transition(.offset(x:430))
              }
            }
            .padding(.vertical, 20)
          }
          .padding(.horizontal, 20)
          Image("Forecast Widgets")
            .opacity(bottomSheetTranslationProrated)
        }
      }
     
      .backgroundBlur(radius: 25, opaque: true)
      .background(Color.bottomSheetBackground)
      .clipShape(RoundedRectangle(cornerRadius: 44))
      .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
      .overlay(
          RoundedRectangle(cornerRadius: 44)
            .stroke(Color.bottomSheetBorderMiddle, lineWidth: 1)
            .blendMode(.overlay)
            .offset( y: 1)
            .blur(radius: 0)
            .mask{
                RoundedRectangle(cornerRadius: 44)
            }
      )
      .overlay(
        Divider()
          .blendMode(.overlay)
          .background(Color.bottomSheetBorderTop)
          .frame(maxHeight:.infinity,alignment: .top)
          .clipShape(RoundedRectangle(cornerRadius: 44))
      )
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .fill(.black.opacity(0.3))
          .frame(width: 44, height: 5)
          .frame(height:20)
          .frame(maxHeight:.infinity, alignment: .top)
      )
      .ignoresSafeArea()
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
        .background(Color.background)
        .preferredColorScheme(.dark)
    }
}
