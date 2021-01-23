//
//  EmployeeDetails.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 20/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension EmployeeDetailsVC : EmployeeDetailsProtocol{
    func moveToMyAccount() {
        //handlePushSegue(viewController: MyAccountVC.self)
    }
    
    func getImage(img: UIImage) {
        profileImg.image = img
    }
    
    func fireErrorAction(msg: String) {
        customFailureAlert(msg: msg)
    }
    
    func reloadEmployeTableView() {
        employeeTableView.reloadData()
    }
    
    func getTechName(techName: String) {
        technicalName.text = techName
    }
    
    func getRate(ratee : Double) {
        rate.text = String(ratee)
    }
    
    func getRateCount(rateeCount : Int) {
        rateCount.text = String(rateeCount)
    }
    
}
