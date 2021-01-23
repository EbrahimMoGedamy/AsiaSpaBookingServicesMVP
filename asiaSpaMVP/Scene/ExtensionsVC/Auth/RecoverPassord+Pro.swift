//
//  RecoverPassord+Pro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import CDAlertView

extension RecoverPasswordVC : RecoverPasswordProtocol{
    
    
    func getMobile() -> String {
        return self.phoneNumberTxtField.text ?? ""
    }
    
    func pushViewController() {
        let vc = ResetPasswordVC(nibName: "ResetPasswordVC", bundle: nil)
        vc.vcode = self.rcoverPasswordPresenter?.vcode ?? ""
        vc.userID = self.rcoverPasswordPresenter?.userID ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
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
}
