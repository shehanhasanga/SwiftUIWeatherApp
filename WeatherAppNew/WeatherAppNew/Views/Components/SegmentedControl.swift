//
//  SegmentedControl.swift
//  WeatherAppNew
//
//  Created by shehan karunarathna on 2022-07-26.
//

import SwiftUI

struct SegmentedControl: View {
  @Binding var selection: Int
    var body: some View {
      VStack(spacing:5){
        HStack{
          Button{
            withAnimation(.easeInOut(duration: 0.5)) {
              selection = 0
            }

          }label: {
            Text("Hourly Forecat")
          }
          .frame(minWidth:0, maxWidth: .infinity)


          Button{
            withAnimation(.easeInOut(duration: 0.5)) {
              selection = 1
            }
          }label: {
            Text("Weekly Forecat")
          }
          .frame(minWidth:0, maxWidth: .infinity)

        }
        .font(.subheadline.weight(.semibold))
        .foregroundColor(.white)

        Divider()
          .background(.white.opacity(0.5))
          .blendMode(.overlay)
          .shadow(color: .black.opacity(0.5), radius: 0, x: 0, y: 1)
          .blendMode(.overlay)
          .overlay(
            HStack{
              Divider()
                .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                .background(Color.underline)
            }
              .frame(maxWidth:.infinity, alignment: selection == 0 ? .leading : .trailing)
              .offset(y : -3)
          )
      }
      .padding(.top, 25)
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
      SegmentedControl(selection: .constant(0))
        .preferredColorScheme(.dark)
    }
}
