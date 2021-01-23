//
//  ViewController + Extension.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static let preventPageSheetPresentation: Void = {
        if #available(iOS 13, *) {
            _swizzling(forClass: UIViewController.self,
                       originalSelector: #selector(present(_: animated: completion:)),
                       swizzledSelector: #selector(_swizzledPresent(_: animated: completion:)))
        }
    }()

    @available(iOS 13.0, *)
    @objc private func _swizzledPresent(_ viewControllerToPresent: UIViewController,
                                        animated flag: Bool,
                                        completion: (() -> Void)? = nil) {
        if viewControllerToPresent.modalPresentationStyle == .pageSheet
                   || viewControllerToPresent.modalPresentationStyle == .automatic {
            viewControllerToPresent.modalPresentationStyle = .fullScreen
        }
        _swizzledPresent(viewControllerToPresent, animated: flag, completion: completion)
    }
    
}


private func _swizzling(forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
    if let originalMethod = class_getInstanceMethod(forClass, originalSelector),
       let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
}

//MARK:- [[[ Segue ]]]
extension UIViewController{
    
    func handlePushSegue<ViewController : UIViewController>(viewController : ViewController.Type){
        
        let viewControllerID = String(describing: viewController.self)
        let vc = ViewController(nibName: viewControllerID, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func handlePresentSegue<ViewController : UIViewController>(viewController : ViewController.Type , completion : (() -> Void)? = nil){
        
        let viewControllerID = String(describing: viewController.self)
        let vc = ViewController(nibName: viewControllerID, bundle: nil)
        self.present(vc, animated: true, completion: completion)
    }
}


