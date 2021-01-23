//
//  VerificationCodeVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol VerificationCodeProtocol : class{

    func getVcode() -> String
    func pushViewController()
    
}

class VerificationCodeVC: UIViewController {

    @IBOutlet weak var mainBu: LocalizableButton!
    @IBOutlet weak var verificationCodeLbl: LocalizableLabel!
    @IBOutlet weak var confirmBu: LocalizableButton!
    @IBOutlet weak var confirmVcodeTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var hideShowPasswordBu: UIButton!
    
    var vcode = ""
    var vCodePresenter : VerificationCodePresenter?
    var msgError = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        msgError = vCodePresenter?.msgError ?? ""
        vCodePresenter = VerificationCodePresenter(vcode: self)
        self.navigationController?.isNavigationBarHidden = true
        self.confirmBu.layer.cornerRadius = 8.0
        self.mainBu.set(image: UIImage(named: "home"), title: "Main", titlePosition: .bottom, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
    }

    @IBAction func hideShowPasswordBuBuTapped(_ sender: LocalizableButton) {
        Password.showUserPassword(textField: self.confirmVcodeTxtField, sender: sender)
    }
    
    @IBAction func confirmBuTapped(_ sender: LocalizableButton) {
        if confirmVcodeTxtField.text == vcode {
            self.vCodePresenter?.viewDidLoad()
        }else{
            setAction(title: "Failed", message: msgError, actionTitle: "Dismiss", handler: nil)
        }
    }
    
}
