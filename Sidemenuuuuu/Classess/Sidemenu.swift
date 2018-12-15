//
//  Sidemenu.swift
//  Sidemenuuuuu
//
//  Created by Varun Peddi on 25/09/18.
//  Copyright © 2018 Varun Peddi. All rights reserved.
//

import UIKit

class Sidemenu: UIViewController {
  
  @IBOutlet weak var imgProfileImg: UIImageView!
  @IBOutlet weak var txtMobileNo: UITextField!
  @IBOutlet weak var txtName: UITextField!
  static var object : Sidemenu?
  @IBOutlet weak var tableVw: UITableView!
  var sliderWidth : CGFloat = 0.0
  var x : CGFloat = 0.0
   var isSidebarShown = true
  @IBOutlet weak var vwForChildVw: UIView!
  @IBOutlet weak var btnFullScreenBlurVw: UIButton!
  @IBOutlet weak var lblShaddow: UILabel!
  @IBOutlet weak var leftConstraint: NSLayoutConstraint!
  var edgePan : UIScreenEdgePanGestureRecognizer!
  var rateCount : Int? = 0;
  //class default methods
  override func viewDidLoad() {
    super.viewDidLoad()
    Sidemenu.object=self
    sliderWidth = -(UIScreen.main.bounds.size.width*0.8)
    leftConstraint.constant = sliderWidth
    x = sliderWidth
    if(UIScreen.main.bounds.size.width > 450.0) {
      tableVw.rowHeight=65
    }
    // add left edge pan gesture
    edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(panGestureHandler))
    edgePan.edges = .left
    addLeftEdgeGesturre()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
 
  
  //set statusbar hidden
  override var prefersStatusBarHidden: Bool {
    return isSidebarShown
  }
  
  
  //btn manage menu
  @IBAction func menu() {
    if(leftConstraint.constant==0){
      closeMenu ()
    }else{
      openMenu ()
    }
  }
  

  
  //return vc by name
  func pushVc (strBdName: String,vcName:String) ->UIViewController {
    return UIStoryboard(name:strBdName,bundle:nil).instantiateViewController(withIdentifier: vcName)
  }
  
  
  //handle pan gesture with selector
  @IBAction func panGestureHandler(_ sender: UIPanGestureRecognizer) {
    pan(sender: sender)
  }
  

}

//uitableview delegates
extension Sidemenu: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell
    cell?.lbl.text = "Home"
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let navBar = CustomNavigationBar.shareInstance()
    navBar.viewControllers = []
    if(indexPath.row==0){
      navBar.pushViewController(self.pushVc(strBdName: "Main", vcName: "Home_VC"), animated: false)
    }else{
      navBar.pushViewController(self.pushVc(strBdName: "Main", vcName: "ViewController"), animated: false)
    }
    self.closeMenu()
  }
}

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
class TableCell: UITableViewCell {
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var lbl: UILabel!
  
}

