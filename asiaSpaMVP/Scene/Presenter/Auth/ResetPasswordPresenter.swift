//
//  ResetPasswordPresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class ResetPasswordPresenter{
    
    weak var resetrPasswordPro : ResetPasswordProtocol?
    
    init(reset : ResetPasswordProtocol?) {
        self.resetrPasswordPro = reset
    }
    func viewDidLoad() {
        getData()
    }
    //Mark :- Api
    func getData() {
        
        let lang = "en" 
        guard let userID = resetrPasswordPro?.getUserID() else { return}
        guard let vCode = resetrPasswordPro?.getVCode() else { return}
        guard let password = resetrPasswordPro?.getPassword() else { return}
        
        let paramters = ["user_id":userID,"v_code":vCode,"lang":lang, "password":password] as [String : Any]
        
        print(paramters)
        guard let url = URL(string: URLs.resetPasswordURL ) else {
            print("error in resetPasswordURL")
            return
        }
        
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : ResetPassword?, responseError : ConfirmPhoneError? , error) in
            guard let self = self else {return}
            
            guard let key = response?.key else {return}
            if let error = error {
                // network error
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.resetrPasswordPro?.fireErrorAction(errorMsg: error.localizedDescription)
                }
            }
            switch key {
            case "success":
                guard let successMsg = response?.msg else { return }
                DispatchQueue.main.async {
                    self.resetrPasswordPro?.fireSuccessAction(successMsg: successMsg)
                }
                print(successMsg)
            case "fail":
                guard let msgError = responseError?.msg else { return }
                print(msgError)
                DispatchQueue.main.async {
                    self.resetrPasswordPro?.fireErrorAction(errorMsg: msgError)
                }
                
            default:
                print("")
            }
        }
    }
}
