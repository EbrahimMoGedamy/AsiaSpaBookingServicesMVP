//
//  PopViews.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
/*  func handlePresentSegue<ViewController : UIViewController>(viewController : ViewController.Type , completion : (() -> Void)? = nil){
      
      let viewControllerID = String(describing: viewController.self)
      let vc = ViewController(nibName: viewControllerID, bundle: nil)
      self.present(vc, animated: true, completion: completion)
  }*/
extension UIViewController : UIPopoverPresentationControllerDelegate{
    func popover<ViewController : UIViewController>(_ sender : UIButton ,style : UIModalPresentationStyle , width:Int , height:Int, vc : ViewController.Type , completion : (() -> Void)? = nil) {
        let viewControllerID = String(describing: vc.self)
        let popVC = ViewController(nibName: viewControllerID, bundle: nil)
        popVC.modalPresentationStyle = style
        popVC.preferredContentSize = CGSize(width: width, height: height)
        let navigationVC = UINavigationController(rootViewController: popVC)
        navigationVC.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = navigationVC.popoverPresentationController
        popover?.delegate = self
        popover?.sourceView = sender
        self.present(navigationVC, animated: true, completion: completion)
    }
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
