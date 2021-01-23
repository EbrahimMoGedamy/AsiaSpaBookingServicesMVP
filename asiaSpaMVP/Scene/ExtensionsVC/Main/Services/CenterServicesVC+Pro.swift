//
//  CenterServicesVC+Pro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension CenterServicesVC : CenterServicesProtocol{
    func gotoBillVC() {
        self.handlePushSegue(viewController: BillVC.self)
    }
    
    func gotoMainVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func fireErrorAction(errorMsg: String) {
        customFailureAlert(msg: errorMsg)
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.unPaidServicesTableView.reloadData()
        }
    }
    
    func reloadCollectionViewData() {
        DispatchQueue.main.async {
            self.servicesCollView.reloadData()
        }
    }
}

