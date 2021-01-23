//
//  ConfirmedBooking+Pro.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 21/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension ConfirmedBookingVC : ConfirmedBookingProtocol{
    
    func getPrice(price: String) {
        priceLbl.text = price
    }
    
    func getDiscount(price: String) {
        discountLbl.text = price
    }
    
    func getTotalPrice(price: String) {
        totalPricePlusEtraPrice.text = price
    }
    
    func fireErrorAction(msg: String) {
        customFailureAlert(msg: msg)
    }
    
    func goToPrintVC() {
        //handlePushSegue(viewController: PrintVC.self)
    }
    
    func goToMainVC() {
        handlePushSegue(viewController: MainVC.self)
    }
    
    func goToAccountVC() {
        //handlePushSegue(viewController: MyAccount.self)
    }
    
    func reloadTableViewData() {
        servicesTableView.reloadData()
    }
    
}
