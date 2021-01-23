//
//  RegisterVC+RegisterPro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import CDAlertView

extension RegisterVC : RegisterProtocol {
    
    func fireSuccessAction(successMsg: String) {
        let alert = CDAlertView(title: "Success", message: successMsg, type: .success)
        let action = CDAlertViewAction(title: "Ok") { [weak self] (_) in
            guard let self = self else {return}
            self.pushViewController()
            print("pushed")
        }

        alert.autoHideTime = 10
        alert.alertBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        alert.titleTextColor = #colorLiteral(red: 0.01143209357, green: 0.3911819458, blue: 0.3708234429, alpha: 1)
        alert.messageTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            alpha = 0
        }
        alert.hideAnimationDuration = 0.88
        alert.add(action: action)
        alert.show()
    }
    
    func fireErrorAction(errorMsg: String) {
        let alert = CDAlertView(title: "Failed", message: errorMsg, type: .error)

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
    
    func reloadData() {
        DispatchQueue.main.async {
            self.countryCodeTableView.reloadData()
        }
    }
    
    func getMobile() -> String {
        return self.phoneNumberTxtField.text ?? ""
    }
    
    func getPassword() -> String {
        return self.passwordTxtField.text ?? ""
    }
    
    func getName() -> String {
        return self.userNameTxtField.text ?? ""
    }
    
    func getEmail() -> String {
        return self.emailTxtField.text ?? ""
    }
    
    func pushViewController() {
        
        let vc = VerificationCodeVC(nibName: "VerificationCodeVC", bundle: nil)
        vc.vcode = String(self.registerPresenter?.vcode ?? "")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

