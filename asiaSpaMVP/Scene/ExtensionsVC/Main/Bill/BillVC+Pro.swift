//
//  BillVC+Pro.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 18/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension BillVC : BillProtocol{
    func setPriceLbl(text: String) {
        oriceLbl.text = text
    }
    
    func setTotalPriceLbl(text: String) {
        totalPriceLbl.text = text
    }
    
    func setDiscountLbl(text: String) {
        discountLbl.text = text
    }
    
    func fireErrorAction(msg: String) {
        customFailureAlert(msg: msg)
    }
    
    func moveToMain() {
        handlePushSegue(viewController: MainVC.self)
    }
    
    func reloadTableViewData() {
        billTableView.reloadData()
    }
    
    func moveToBookingConfirm() {
        let vc = ConfirmedBookingVC(nibName: "ConfirmedBookingVC", bundle: nil)
        vc.orderID = orderID
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
