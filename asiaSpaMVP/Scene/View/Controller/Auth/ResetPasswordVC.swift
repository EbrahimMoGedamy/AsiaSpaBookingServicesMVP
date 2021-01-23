//
//  ResetPasswordVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol ResetPasswordProtocol : class {
    func getVCode() -> String
    func getUserID() -> Int
    func getPassword() -> String
    func getConfirmPassword() -> String
    func pushViewController()
    func fireSuccessAction(successMsg : String)
    func fireErrorAction(errorMsg : String )
}

class ResetPasswordVC: UIViewController {
    
    @IBOutlet weak var recoverPasswordLbl: LocalizableLabel!
    @IBOutlet weak var vcodeTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTxtField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var confirmBu: LocalizableButton!
    var resetPasswordPresenter : ResetPasswordPresenter?
    var vcode = ""
    var userID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resetPasswordPresenter = ResetPasswordPresenter(reset: self)
        self.navigationController?.isNavigationBarHidden = true
        self.confirmBu.layer.cornerRadius = 8.0
    }
    
    @IBAction func confirmBuTapped(_ sender: LocalizableButton) {
        self.resetPasswordPresenter?.viewDidLoad()
    }
    
    @IBAction func mainBuTapped(_ sender: LocalizableButton) {
       self.handlePushSegue(viewController: MainVC.self)
    }
    @IBAction func showPasswordBuTapped(_ sender: LocalizableButton) {
         Password.showUserPassword(textField: passwordTxtField, sender: sender)
    }
    @IBAction func showConfirmPassordBuTapped(_ sender: LocalizableButton) {
         Password.showUserPassword(textField: confirmPasswordTxtField, sender: sender)
    }
    
}
