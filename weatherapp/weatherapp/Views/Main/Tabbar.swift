//
//  Tabbar.swift
//  weatherapp
//
//  Created by shehan karunarathna on 2022-07-02.
//

import SwiftUI

struct Tabbar: View {
  var action: () -> Void
    var body: some View {
      ZStack{
        Arc()
                        .fill(Color.tabBarBackground)
                        .frame(height: 88)
                        .overlay {
                            // MARK: Arc Border
                            Arc()
                                .stroke(Color.tabBarBorder, lineWidth: 0.5)
                        }

        HStack{
          Button{
            action()
          }label: {
            Image(systemName: "mappin.and.ellipse")
              .frame(width: 44, height: 44)
          }
          Spacer()
          NavigationLink{
            
          }label: {
            Image(systemName: "list.star")
              .frame(width: 44, height: 44)
          }
        }
        .font(.title2)
        .foregroundColor(.white)
      }
      .frame(maxHeight:.infinity, alignment: .bottom)
      .ignoresSafeArea()
      .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
      .foregroundColor(.white)
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
      Tabbar(action: {})
        .preferredColorScheme(.dark)
    }
}
