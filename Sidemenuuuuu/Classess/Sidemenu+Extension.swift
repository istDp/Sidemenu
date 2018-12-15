//
//  Sidemenu+Extension.swift
//  Sidemenuuuuu
//
//

import Foundation
import UIKit

extension Sidemenu{
  
  //add left swipe gesture
  func addLeftEdgeGesturre(){
    vwForChildVw.addGestureRecognizer(edgePan)
  }
  
  //remove left swipe gesture
  func removeLeftEdgeGesturre(){
    vwForChildVw.removeGestureRecognizer(edgePan)
  }
  
  //class share instance
  class func shareInstance() -> Sidemenu{
    return object!
  }
  //close menu
  func closeMenu (){
    leftConstraint.constant = sliderWidth
    lblShaddow.layer.shadowOpacity = 0
    UIView.animate(withDuration: 0.3, animations: {
      self.view.layoutIfNeeded()
    }, completion: { (yes) in
      self.isSidebarShown = false
      self.setNeedsStatusBarAppearanceUpdate()
      self.btnFullScreenBlurVw.isHidden=true
      self.x = self.sliderWidth
      self.vwForChildVw.isUserInteractionEnabled=true
    })
  }
  //open menu
  func openMenu (){
    x=0
    btnFullScreenBlurVw.isHidden=false
    lblShaddow.layer.shadowOpacity = 1
    leftConstraint.constant=0
    isSidebarShown = true
    setNeedsStatusBarAppearanceUpdate()
    UIView.animate(withDuration: 0.3) {
      self.view.layoutIfNeeded()
    }
  }
  //handel left edge pan and pan gesture
  func pan (sender:UIPanGestureRecognizer){
    if(sender.state == UIGestureRecognizerState.began){
      vwForChildVw.isUserInteractionEnabled=false
      isSidebarShown = true
      btnFullScreenBlurVw.isHidden=false
      setNeedsStatusBarAppearanceUpdate()
    }
    else if(sender.state == UIGestureRecognizerState.changed){
      stateChangedOfPan(sender:sender)
    }
    else if(sender.state == UIGestureRecognizerState.ended){
      stateEndedOfPan(sender: sender)
      vwForChildVw.isUserInteractionEnabled=true
    }
  }
  
  //uipan gesture state is changed(moved)
  func stateChangedOfPan (sender:UIPanGestureRecognizer){
    let points = sender.translation(in: sender.view)
    if(x+points.x<=0 && x+points.x>sliderWidth){
      x = x+points.x
      leftConstraint.constant=x
      lblShaddow.layer.shadowOpacity = 1
    }
    sender.setTranslation(CGPoint.zero, in: sender.view)
  }
  
  //uipangesture state ended
  func stateEndedOfPan (sender:UIPanGestureRecognizer){
    let points = sender.velocity(in: sender.view)
    if(points.x<500 && points.x>(-500)){
      if(x>(sliderWidth/2)){
        openMenu ()
      }else{
        closeMenu ()
      }
    }
    else{
      if(points.x>0){
        openMenu ()
      }else{
        closeMenu ()
      }
    }
  }
}
