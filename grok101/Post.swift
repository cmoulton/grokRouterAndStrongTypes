//
//  Post.swift
//  grok101
//
//  Created by Christina Moulton on 2015-10-20.
//  Copyright © 2015 Teak Mobile Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Post:ResponseJSONObjectSerializable {
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
  
  required init?(json: SwiftyJSON.JSON) {
    self.title = json["title"].string
    self.body = json["body"].string
    self.id = json["id"].int
    self.userId = json["userId"].int
  }
  
  func description() -> String {
    return "ID: \(self.id)" +
      "User ID: \(self.userId)" +
      "Title: \(self.title)\n" +
    "Body: \(self.body)\n"
  }

  // MARK: API Calls
  class func postByID(id: Int, completionHandler: (Result<Post, NSError>) -> Void) {
    Alamofire.request(PostRouter.Get(id))
      .responseObject { (response: Response<Post, NSError>) in
        completionHandler(response.result)
      }
  }
}