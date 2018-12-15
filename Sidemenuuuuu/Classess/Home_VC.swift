
//
//  Home_VC.swift
//  Sidemenuuuuu
//
//  Created by Varun Peddi on 30/09/18.
//  Copyright © 2018 Varun Peddi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Home_VC: ButtonBarPagerTabStripViewController{
  
  
  @IBOutlet weak var shadowView: UIView!
  
  override func viewDidLoad() {
    // change selected bar color
    settings.style.buttonBarBackgroundColor = .white
    settings.style.buttonBarItemBackgroundColor = .red
    settings.style.selectedBarBackgroundColor = .red
    settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
    settings.style.selectedBarHeight = 3.0
    settings.style.buttonBarMinimumLineSpacing = 0
    settings.style.buttonBarItemTitleColor = .black
    settings.style.buttonBarItemsShouldFillAvailableWidth = true
    settings.style.buttonBarLeftContentInset = 0
    settings.style.buttonBarRightContentInset = 0
    changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
      guard changeCurrentIndex == true else { return }
      oldCell?.label.textColor = UIColor.lightGray
      newCell?.label.textColor = .white
    }
    super.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    Sidemenu.shareInstance().addLeftEdgeGesturre()
    self.navigationController?.isNavigationBarHidden=true
  }
  
  //unwind segue
  @IBAction func unwindToHomePage(segue: UIStoryboardSegue) {}
  
  
  //button menu
  @IBAction func btnMenu(_ sender: UIButton) {
    Sidemenu.shareInstance().menu()
    view.endEditing(true)
  }
  
  // MARK: - PagerTabStripDataSource
  override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PastBooking_VC") as? PastBooking_VC
    vc?.itemInfo  = "Upcoming Bookings"
    let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "PastBooking_VC") as? PastBooking_VC
    vc2?.itemInfo  = "Upcoming Bookings"
    return [vc!, vc2!]
  }
  
}



