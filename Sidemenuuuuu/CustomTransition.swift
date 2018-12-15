//
//  CustomTransition.swift
//  Sidemenuuuuu
//
//  Created by Varun Peddi on 30/09/18.
//  Copyright © 2018 Varun Peddi. All rights reserved.
//

//custem uinavigation bar
import UIKit

class CustomNavigationBar: UINavigationController {
  
  static var obj : CustomNavigationBar?
  override var preferredStatusBarStyle: UIStatusBarStyle{
    return .default
  }
  
  override func loadView() {
    super.loadView()
    CustomNavigationBar.obj=self
  }
  class func shareInstance() -> CustomNavigationBar{
    return obj!
  }
  
}
