//
//  Sidebar.swift
//  ResposeUI
//
//  Created by shehan karunarathna on 2022-06-25.
//

import SwiftUI

struct Sidebar: View {
  @Binding var currentMenu : String
  var prop :Properties
    var body: some View {
      ScrollView(.vertical, showsIndicators: false){
        VStack(alignment:.leading, spacing: 20){
          Image(systemName: "envelope.circle.fill").font(.system(size: 30))
          SidebarButton(icon: "tray.and.arrow.down.fill", title: "Inbox")
            .padding(.top, 40)
          SidebarButton(icon: "paperplane", title: "Sent")
          SidebarButton(icon: "doc.fill", title: "Draft")
          SidebarButton(icon: "trash", title: "Deleted")

        }
        .padding()
      }
      .frame(width: prop.size.width / 2.5 > 300 ? 300 : prop.size.width / 2.5)
      .background(.purple.opacity(0.2))
    }

  @ViewBuilder
  func SidebarButton (icon : String , title : String) -> some View{
    Button{
      currentMenu = title
    }label: {
      VStack(){
        HStack(spacing:10){
          Image(systemName: "chevron.right")
            .font(.caption)
            .foregroundColor(.black)
            .opacity(currentMenu == title ? 1 : 0)
          Image(systemName: icon)
            .font(.callout)
            .foregroundColor(currentMenu == title ? .blue : .gray)
          Text(title)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(currentMenu == title ? .black : .gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

        Divider()
      }

    }
  }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
