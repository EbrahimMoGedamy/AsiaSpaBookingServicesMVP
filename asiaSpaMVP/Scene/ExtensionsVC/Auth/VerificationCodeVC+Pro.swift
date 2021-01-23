//
//  VerificationCodeVC+Pro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension VerificationCodeVC : VerificationCodeProtocol{
    func getVcode() -> String {
        return self.vcode
    }
    
    func pushViewController() {
//        Alert.showErrorAlert(title: "Verification code success", body: "")
        self.handlePushSegue(viewController: MainVC.self)
        Helper.restartApp()
    }

}
