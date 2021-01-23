//
//  UITapGesureRecognizer.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func dismissPopup(myView : AnyObject) {
        myView.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
    }
    @objc func dismissOnTapOutside(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func dismissPopUPView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.delegate = self as? UIGestureRecognizerDelegate
        self.view.window?.addGestureRecognizer(tap)
    }
    @objc func onTap(sender : UITapGestureRecognizer){
        self.view?.window?.removeGestureRecognizer(sender)
        self.dismiss(animated: true, completion: nil)
    }
}
