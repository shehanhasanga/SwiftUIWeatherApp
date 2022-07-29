//
//  WeatherView.swift
//  WeatherAppNew
//
//  Created by shehan karunarathna on 2022-07-29.
//

import SwiftUI

struct WeatherView: View {
  @State var searchTxt :String = ""
  var searchResults : [Forecast] {
    if(searchTxt.isEmpty){
      return Forecast.cities
    } else{
      return Forecast.cities.filter { forecast in
        return forecast.location.lowercased().contains(searchTxt)
      }
    }
  }
    var body: some View {
      ZStack{
        Color.background
          .ignoresSafeArea()
        ScrollView( showsIndicators: false) {
          VStack(spacing:20){
            ForEach(searchResults){
              forecast in
              WeatherWidjet(forecast: forecast)
            }
          }
        }
        .safeAreaInset(edge: .top) {
          EmptyView()
            .frame(height:110)
        }

      }
      .overlay(
        NavigationBar(searchTxt: $searchTxt)
      )
      .navigationBarHidden(true)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
        .preferredColorScheme(.dark)
    }
}
