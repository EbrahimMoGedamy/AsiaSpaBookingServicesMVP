//
//  LoginVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/14/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol LoginProtocol : class {
    func getPhone() -> String
    func getPassword() -> String
    func reloadData()
    func pushViewController()
    func fireCustomError(msg:String)
}

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var hideShowPasswordBu: UIButton!
    @IBOutlet weak var countryCodeBu: UIButton!
    @IBOutlet weak var countryCodeTableView: UITableView!
    @IBOutlet weak var loginLbl: LocalizableLabel!
    @IBOutlet weak var mainBu: LocalizableButton!
    @IBOutlet weak var loginBu: LocalizableButton!
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneTxtField: SkyFloatingLabelTextField!
    
    var countryCodeBuTitle = ""
    var loginPresenter : LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.mainBu.set(image: #imageLiteral(resourceName: "house_outline"), title: "Main", titlePosition: .bottom, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        phoneTxtField.addTarget(self, action: #selector(phoneTextFieldDidChange(_:)), for: .editingChanged)
        
        passwordTxtField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        self.loginBu.layer.cornerRadius = 8.0
        self.countryCodeBu.layer.cornerRadius = 5.0
        self.countryCodeBu.set(image: #imageLiteral(resourceName: "expand-arrow"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.countryCodeTableView.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        self.loginPresenter = LoginPresenter(login: self)
        self.loginPresenter?.getIsoIdData()
        self.setUpTableView()
        
    }
    
    
    // Mark: - func of showing and hiding countryCodeTableView
    func showCountryCodeTableView( _ sender : UIButton) {
        if countryCodeTableView.isHidden == true {
            countryCodeTableView.isHidden = false
        }else{
            countryCodeTableView.isHidden = true
        }
    }
    
    @objc func phoneTextFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if(text.filterPhoneNumber().isValidPhone()){
                    floatingLabelTextField.errorMessage = ""
                }
                else {
                    floatingLabelTextField.errorMessage = "Invalid Phone Number"
                    floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    floatingLabelTextField.lineErrorColor = .red
                    
                }
            }
        }
    }
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if(text.isValidPassword()){
                    floatingLabelTextField.errorMessage = "Strong Password"
                    floatingLabelTextField.lineErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    floatingLabelTextField.titleErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                }
                else {
                    floatingLabelTextField.errorMessage = "Weak Password"
                    floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    floatingLabelTextField.lineErrorColor = .red
                    
                }
            }
        }
    }
    
    @IBAction func hideShowPasswordBuBuTapped(_ sender: LocalizableButton) {
        Password.showUserPassword(textField: self.passwordTxtField, sender: sender)
    }
    
    @IBAction func countryCodeBuTapped(_ sender: UIButton) {
        self.showCountryCodeTableView(sender)
    }
    
    @IBAction func loginBuTapped(_ sender: LocalizableButton) {
        if(passwordTxtField.text != "" && phoneTxtField.text != "" ){
            loginPresenter?.getLoginApiData()
        }else{
            setAction(title: "Failed", message: "msgError", actionTitle: "Dismiss", handler: nil)
        }
        
    }
    
    @IBAction func creatAccountBuTapped(_ sender: LocalizableButton) {
        self.handlePushSegue(viewController: RegisterVC.self)
    }
    
    @IBAction func forgetPasswordBuTapped(_ sender: LocalizableButton) {
        self.handlePushSegue(viewController: RecoverPasswordVC.self)
    }
    @IBAction func mainBuBuTapped(_ sender: LocalizableButton) {
        self.handlePushSegue(viewController: MainVC.self)
    }

}

