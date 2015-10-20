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
  
  func toJSON() -> Dictionary<String, AnyObject> {
    var json = Dictionary<String, AnyObject>()
    if let title = title {
      json["title"] = title
    }
    if let body = body {
      json["body"] = body
    }
    if let id = id {
      json["id"] = id
    }
    if let userId = userId {
      json["userId"] = userId
    }
    return json
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
  
  // POST / Create
  func save(completionHandler: (Result<Post, NSError>) -> Void) {
    guard let fields:Dictionary<String, AnyObject> = self.toJSON() else {
      print("error: error converting newPost fields to JSON")
      return
    }
    Alamofire.request(PostRouter.Create(fields))
      .responseObject { (response: Response<Post, NSError>) in
        completionHandler(response.result)
    }
  }
}