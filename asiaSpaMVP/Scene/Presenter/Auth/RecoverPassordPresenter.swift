//
//  RecoverPassordPresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class RecoverPassordPresenter{
    
    weak var recoverPasswordPro : RecoverPasswordProtocol?
    var vcode = ""
    var userID = 0
    
    
    init(recover : RecoverPasswordProtocol?) {
        self.recoverPasswordPro = recover
    }
    
    //Mark :- Api
    func viewDidLoad() {
        
        let lang = "en"
        guard let isoID = Helper.getApiIsoID() else { return}
        guard let phone = recoverPasswordPro?.getMobile() else { return}
    
        let paramters = ["iso_id":isoID,"phone":phone,"lang":lang] as [String : Any]
        
        print(paramters)
        guard let url = URL(string: URLs.forgetPasswordURL ) else {
            print("error in forgetPasswordURL")
            return
        }
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : RecoverPassword?, responseError : ConfirmPhoneError?, error) in
            guard let self = self else {return}
            
            guard let key = response?.key else {return}
            if let error = error {
                // network error
                print(error.localizedDescription)
                self.recoverPasswordPro?.fireErrorAction(errorMsg: error.localizedDescription)
            }
            switch key {
            case "success":
                guard let responseModel = response else { return }
                self.vcode = responseModel.data.vCode
                self.userID = responseModel.data.userID
                print("vcode \(responseModel.data.vCode)")
                self.recoverPasswordPro?.pushViewController()
            case "fail":
                guard let msgError = responseError?.msg else { return }
                print(msgError)
                self.recoverPasswordPro?.fireErrorAction(errorMsg: msgError)
            default:
                print("")
            }
            
        }
//        AF.request(url, method: .post, parameters: paramters)
//            .responseJSON(completionHandler: {  (response) in
//                print("URL : \(url)")
//                do{
//                    let jsonData = try JSONDecoder().decode(RecoverPassword.self, from: response.data! )
//                    print(jsonData)
//                    self.vcode = jsonData.data.vCode
//                }catch{
//                    print(error)
//                }
//            }
//        )
    }
}
