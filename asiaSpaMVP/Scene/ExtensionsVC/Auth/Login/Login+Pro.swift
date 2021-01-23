//
//  Login+Pro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension LoginVC : LoginProtocol{
    func fireCustomError(msg: String) {
        customFailureAlert(msg: msg)
    }
    
    func reloadData() {
        self.countryCodeTableView.reloadData()
    }
    
    func getPhone() -> String {
        return self.phoneTxtField.text ?? ""
    }
    
    func getPassword() -> String {
        return self.passwordTxtField.text ?? ""
    }
    
    func pushViewController() {
        self.handlePushSegue(viewController: MainVC.self)
    }
}
