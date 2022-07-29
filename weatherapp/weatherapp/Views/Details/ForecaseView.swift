//
//  ForecaseView.swift
//  weatherapp
//
//  Created by shehan karunarathna on 2022-07-02.
//

import SwiftUI

struct ForecaseView: View {
    var body: some View {
      ScrollView{

      }
      .backgroundBlur(radius: 25, opaque: true)
      .background(Color.bottomSheetBackground)
      .clipShape(RoundedRectangle(cornerRadius: 44))
      .overlay {
          Divider()
          .blendMode(.overlay)
          .background(Color.bottomSheetBorderTop)
          .frame(maxHeight:.infinity, alignment: .top)
          .clipShape(RoundedRectangle(cornerRadius: 44))
      }
      .overlay {
        RoundedRectangle(cornerRadius: 10)
          .fill(.black.opacity(0.3))
          .frame(width: 48, height: 5)
          .frame(height:20)
          .frame(maxHeight:.infinity, alignment: .top)
      }
    }
}

struct ForecaseView_Previews: PreviewProvider {
    static var previews: some View {
        ForecaseView()
        .background(Color.background)
        .preferredColorScheme(.dark)
    }
}
