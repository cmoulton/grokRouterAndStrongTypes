//
//  Post.swift
//  grok101
//
//  Created by Christina Moulton on 2015-10-20.
//  Copyright © 2015 Teak Mobile Inc. All rights reserved.
//

import Foundation

class Post {
  var title:String?
  var body:String?
  var id:Int?
  var userId:Int?
  
  required init?(aTitle: String?, aBody: String?, anId: Int?, aUserId: Int?) {
    self.title = aTitle
    self.body = aBody
    self.id = anId
    self.userId = aUserId
  }
  
  func description() -> String {
    return "ID: \(self.id)" +
      "User ID: \(self.userId)" +
      "Title: \(self.title)\n" +
    "Body: \(self.body)\n"
  }
}