//
//  WeatherWidjet.swift
//  WeatherAppNew
//
//  Created by shehan karunarathna on 2022-07-29.
//

import SwiftUI

struct WeatherWidjet: View {
  var forecast:Forecast
    var body: some View {
      ZStack(alignment: .bottom){
        Trapezoid()
          .fill(Color.weatherWidgetBackground)
          .frame(width: 342, height: 184)
        HStack(alignment:.bottom){
          VStack(alignment: .leading, spacing: 8) {
            Text("\(forecast.temperature)°")
              .font(.system(size: 64))
            VStack(alignment: .leading, spacing: 2) {
              Text("H \(forecast.high)°  L\(forecast.low)°")
                .font(.footnote)
                .foregroundColor(.secondary)
              Text(forecast.location)
                .font(.body)
                .lineLimit(1)
            }
          }
          Spacer()
          VStack(alignment: .trailing, spacing: 0) {
            Image("\(forecast.icon) large")
              .padding(.trailing, 4)
            Text(forecast.weather.rawValue)
              .font(.footnote)
              .padding(.trailing, 24)
          }
        }
        .foregroundColor(.white)
        .padding(.leading, 20)
        .padding(.bottom, 20)

      }
      .frame(width: 342, height: 184, alignment: .bottom)
    }
}

struct WeatherWidjet_Previews: PreviewProvider {
    static var previews: some View {
      WeatherWidjet(forecast: Forecast.cities[0])
        .preferredColorScheme(.dark)
    }
}
