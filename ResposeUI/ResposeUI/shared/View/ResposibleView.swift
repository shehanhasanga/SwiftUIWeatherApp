//
//  ResposibleView.swift
//  ResposeUI
//
//  Created by shehan karunarathna on 2022-06-25.
//

import SwiftUI

struct ResposibleView<Content: View>: View {
  var content: (Properties) -> Content
    var body: some View {
      GeometryReader{
        proxy in
        let size = proxy.size
        let isLandscape = (size.width > size.height)
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad
        content(Properties(isLandscape: isLandscape, isIpad: isIpad, size: size))
          .frame(width: size.width, height: size.height, alignment: .center)
      }
    }
}

struct Properties{
  var isLandscape : Bool
  var isIpad: Bool
  var size : CGSize
}


