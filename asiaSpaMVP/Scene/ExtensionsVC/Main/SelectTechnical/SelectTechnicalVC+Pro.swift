//
//  SelectTechnicalVC+Pro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import CDAlertView

extension SelectTechnicalVC : SelectTechnicalProtocol{
    
    func pushToAnotherService() {
        let vc = CenterServicesVC(nibName: "CenterServicesVC", bundle: nil)
        vc.type = "center"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushToPay() {
        let vc = BillVC(nibName: "BillVC", bundle: nil)
        vc.orderID = self.orderID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func fireFailPopup(msg: String) {
        let alert = CDAlertView(title: "FailedAlert".localized(), message: msg, type:.custom(image: #imageLiteral(resourceName: "deleteicon")))
        alert.autoHideTime = 10
        alert.alertBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        alert.titleTextColor = #colorLiteral(red: 0.01143209357, green: 0.3911819458, blue: 0.3708234429, alpha: 1)
        alert.messageTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            alpha = 0
        }
        alert.hideAnimationDuration = 0.88
        alert.show()
    }
    
    func fireSuccessPopup(msg : String) {
        let alert = CDAlertView(title: "SuccessAlert".localized(), message: msg, type: .custom(image: #imageLiteral(resourceName: "check")))
        let addServiceAction = CDAlertViewAction(title: "Add another service".localized()) { [weak self] (_) in
            guard let self = self else {return}
            self.pushToAnotherService()
        }
        let confirmPayAction = CDAlertViewAction(title: "Confirm and pay".localized()) { [weak self] (_) in
            guard let self = self else {return}
            self.pushToPay()
        }
        
        //alert.autoHideTime = 10
        alert.alertBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        alert.titleTextColor = #colorLiteral(red: 0.01143209357, green: 0.3911819458, blue: 0.3708234429, alpha: 1)
        alert.messageTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            alpha = 0
        }
        alert.hideAnimationDuration = 0.88
        alert.add(action: addServiceAction)
        alert.add(action: confirmPayAction)
        alert.show()
    }
    
    func reloadDayCollectionView() {
        self.selectDay.reloadData()
    }
    
    func reloadTimeCollectionView() {
        self.selectTime.reloadData()
    }
    
    func reloadTechnicalCollectionView() {
        self.selectTechnicalCollView.reloadData()
    }
}
