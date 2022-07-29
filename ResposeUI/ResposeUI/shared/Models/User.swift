//
//  User.swift
//  ResposeUI
//
//  Created by shehan karunarathna on 2022-06-25.
//

import Foundation

struct User : Identifiable{
  var id = UUID().uuidString
  var name : String
  var image: String
  var title : String

}


var users : [User] = [
  User(name: "name1", image: "image1", title: "title1"),
  User(name: "name2", image: "image2", title: "title2"),
  User(name: "name3", image: "image3", title: "title3"),


]
