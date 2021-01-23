//
//  MassageVC+Pro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension MassageVC : MassageProtocol{
    func fireErrorAction(errorMsg: String) {
        func fireErrorAction(errorMsg: String) {
            customFailureAlert(msg: errorMsg)
        }
    }
    
    func servicesTableViewData() {
        DispatchQueue.main.async {
            self.servicesTableView.reloadData()
        }
    }
    
    func unPaidServicesTableViewData() {
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

extension MassageVC : ServicesTVCellProtocol {
    func didSelect() {
        if Helper.getApiID() == nil || Helper.getApiID() == 0{
            self.handlePushSegue(viewController: LoginVC.self)
        }else{
            let vc = SelectTechnicalVC(nibName: "SelectTechnicalVC", bundle: nil)
            vc.singleSubId = self.subServiceId
            vc.type = self.type
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
