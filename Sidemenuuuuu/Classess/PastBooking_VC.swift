//
//  PastBooking_VC.swift
//  BUUS
//
//  Created by Dugra on 4/20/18.
//  Copyright © 2018 Igniva Solutions. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PastBooking_VC: UIViewController,IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "View"

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
    // MARK: - IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
