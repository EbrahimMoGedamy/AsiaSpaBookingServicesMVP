//
//  RegisterVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol RegisterProtocol : class{
    
    func getMobile() -> String
    func getPassword() -> String
    func getName() -> String
    func getEmail() -> String
    func reloadData()
    func pushViewController()
    func fireSuccessAction(successMsg : String)
    func fireErrorAction(errorMsg : String )
}

class RegisterVC: UIViewController{
    
    @IBOutlet weak var registerLbl: LocalizableLabel!
    @IBOutlet weak var phoneNumberTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var hideShowPasswordBu: UIButton!
    @IBOutlet weak var hideShowConfirmPasswordBu: UIButton!
    @IBOutlet weak var countryCodeBu: UIButton!
    @IBOutlet weak var countryCodeTableView: UITableView!
    @IBOutlet weak var backBu: LocalizableButton!
    @IBOutlet weak var registerBu: LocalizableButton!
    @IBOutlet weak var confirmpasswordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var userNameTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    
    var registerPresenter : RegisterPresenter?
    var countryCodeBuTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        emailTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phoneNumberTxtField.addTarget(self, action: #selector(phoneTextFieldDidChange(_:)), for: .editingChanged)
        userNameTxtField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        passwordTxtField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        confirmpasswordTxtField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        registerPresenter = RegisterPresenter(register: self)
        self.registerBu.layer.cornerRadius = 8.0
        countryCodeTableView.isHidden = true
        self.registerPresenter?.getIsoId()
        self.countryCodeBu.set(image: #imageLiteral(resourceName: "expand-arrow"), title: "", titlePosition: .right, additionalSpacing: 3, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.setUpTableView()
        self.countryCodeBu.layer.cornerRadius = 8.0
        userNameTxtField.isLTRLanguage = true
        userNameTxtField.resignFirstResponder()
        
    }
    //MARK:- This will notify us when something has changed on the textfield
    @objc func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if(text.isValidEmail()){
                    floatingLabelTextField.errorMessage = ""
                }
                else {
                    floatingLabelTextField.errorMessage = "Invalid email"
                    floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    floatingLabelTextField.lineErrorColor = .red
                    
                }
            }
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
    
    @objc func usernameTextFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if(text.isValidName()){
                    floatingLabelTextField.errorMessage = ""
                }
                else {
                    floatingLabelTextField.errorMessage = "Invalid Username"
                    floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    floatingLabelTextField.lineErrorColor = .red
                    
                }
            }
        }
    }
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if textfield == passwordTxtField{
                    if(text.isValidPassword()){
                        floatingLabelTextField.errorMessage = "Valid Password"
                        floatingLabelTextField.lineErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                        floatingLabelTextField.titleErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)

                    }
                    else {
                        floatingLabelTextField.errorMessage = "Invalid Password"
                        floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                        floatingLabelTextField.lineErrorColor = .red
                        floatingLabelTextField.titleErrorColor = .red
                        
                    }
                }
                if textfield == confirmpasswordTxtField {
                    if (textfield.text != passwordTxtField.text){
                        floatingLabelTextField.errorMessage = "Confirm password doesn't match password"
                        floatingLabelTextField.lineErrorColor = .red
                        floatingLabelTextField.titleErrorColor = .red
                    }else{
                        floatingLabelTextField.errorMessage = "Valid confirm password"
                        floatingLabelTextField.lineErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                        floatingLabelTextField.titleErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    }
                }
            }
        }
    }
    //https://www.tutorialspoint.com/generic-way-to-validate-textfield-inputs-in-swift
    
    // MARK:- func of showing and hiding countryCodeTableView
    func showCountryCodeTableView( _ sender : UIButton) {
        if countryCodeTableView.isHidden == true {
            countryCodeTableView.isHidden = false
        }else{
            countryCodeTableView.isHidden = true
        }
    }
    
    /// Validation of input
    func validationOfTextFields(){
        
        if(passwordTxtField.text != "" && confirmpasswordTxtField.text != ""  && phoneNumberTxtField.text != "" && (passwordTxtField.text == confirmpasswordTxtField.text)){
            registerPresenter?.registerBu()
        }
    }
    
    @IBAction func hideShowPasswordBuBuTapped(_ sender: LocalizableButton) {
        Password.showUserPassword(textField: self.passwordTxtField, sender: sender)
    }
    
    @IBAction func hideShowConfirmPasswordBuBuTapped(_ sender: LocalizableButton) {
        Password.showUserPassword(textField: self.confirmpasswordTxtField, sender: sender)
    }
    
    @IBAction func countryCodeBuTapped(_ sender: UIButton) {
        self.showCountryCodeTableView(sender)
    }
    
    @IBAction func haveAccountBuTapped(_ sender: LocalizableButton) {
        self.handlePushSegue(viewController: LoginVC.self)
    }
    
    @IBAction func registerBuTapped(_ sender: LocalizableButton) {
        validationOfTextFields()
    }
}

