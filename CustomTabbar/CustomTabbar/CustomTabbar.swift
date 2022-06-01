//
//  CustomTabbar.swift
//  CustomTabbar
//
//  Created by shehan karunarathna on 2022-05-01.
//

import SwiftUI

struct CustomTabbar: View {
  @Binding var currentTab:Tab
  @State var yoffset : CGFloat = 0
    var body: some View {
      GeometryReader{
        proxy in
        HStack(spacing:0){
          ForEach(Tab.allCases, id:\.rawValue){
            tab in
            Button{
              withAnimation(.easeInOut(duration: 0.2)){
                currentTab = tab
                yoffset = -80
              }
              withAnimation(.easeInOut(duration: 0.45).delay(0.05)){
                yoffset = 0
              }
            }label: {
              Image(systemName: "heart")
                .font(.system(size: 30))
                .frame(maxWidth:.infinity)
                .foregroundColor(currentTab == tab ? .blue : .gray)
            }
          }
        }.frame(maxWidth:.infinity)
          .background(alignment: .leading) {
            Circle()
              .fill(Color.yellow)
              .frame(width:20)
              .offset(x:indicatorOffset(width: proxy.size.width) , y: yoffset)
          }

      }
      .frame(height:30)
      .padding(.bottom, 10)
      .padding([.horizontal, .top])

    }

  func indicatorOffset(width:CGFloat) -> CGFloat{
    let index = CGFloat(getIndex())
    if index == 0 {return 10}
    let btnWidth = width / CGFloat(Tab.allCases.count)
    return (index * btnWidth) + 10
  }

  func getIndex() -> Int{
    switch(currentTab){
    case .bookmark:
      return 0
    case .time:
      return 1
    case .camera:
      return 2
    case .chat:
      return 3
    case .settings:
      return 4
    }

  }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
