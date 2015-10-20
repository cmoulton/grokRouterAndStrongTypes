//
//  ViewController.swift
//  grok101
//
//  Created by Christina Moulton on 2015-10-20.
//  Copyright © 2015 Teak Mobile Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    // MARK: Get Post #1
    Post.postByID(1, completionHandler: { result in
      if let error = result.error {
        // got an error in getting the data, need to handle it
        print("error calling POST on /posts")
        print(error)
        return
      }
      guard let post = result.value else {
        print("error calling POST on /posts: result is nil")
        return
      }
      // success!
      print(post.description())
      print(post.title)
    })
    
    // MARK: POST
    // Create new post
    /*var newPost = Post(aTitle: "Frist Psot", aBody: "I iz fisrt", anId: nil, aUserId: 1)
    if (newPost == nil)
    {
      print("error: newPost isn't a Post")
      return
    }*/
    /*newPost!.save({ (post, error) in
      if let anError = error
      {
        // got an error in getting the data, need to handle it
        print("error calling POST on /posts")
        print(anError)
        return
      }
      if post == nil {
        print("error calling POST on /posts: result is nil")
        return
      }
      // success!
      print(post!.description())
      print(post!.title)
    })*/
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

