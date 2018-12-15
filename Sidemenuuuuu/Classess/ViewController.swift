//
//  ViewController.swift
//  Sidemenuuuuu
//
//  Created by Varun Peddi on 25/09/18.
//  Copyright © 2018 Varun Peddi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let x = fma
    // Do any additional setup after loading the view, typically from a nib.
  }
  @IBAction func onAction(_ sender: Any) {
    Sidemenu.shareInstance().openMenu()
  }
  
  //unwind segue
  @IBAction func unwindToHomePage(segue: UIStoryboardSegue) {}

  

}

