//
//  RecoverPasswordVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import SkyFloatingLabelTextField
import UIKit

protocol RecoverPasswordProtocol : class {
    func getMobile() -> String
    func pushViewController()
    func fireErrorAction(errorMsg : String )
}
class RecoverPasswordVC: UIViewController {

    @IBOutlet weak var recoverPasswordLbl: LocalizableLabel!
    @IBOutlet weak var phoneNumberTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var mainBu: LocalizableButton!
    @IBOutlet weak var sendBu: LocalizableButton!
    
    var rcoverPasswordPresenter : RecoverPassordPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rcoverPasswordPresenter = RecoverPassordPresenter(recover: self)
        self.navigationController?.isNavigationBarHidden = true
        self.sendBu.layer.cornerRadius = 8.0
        
    }
    
    @IBAction func sendBuTapped(_ sender: LocalizableButton) {
        self.rcoverPasswordPresenter?.viewDidLoad()
    }

}
