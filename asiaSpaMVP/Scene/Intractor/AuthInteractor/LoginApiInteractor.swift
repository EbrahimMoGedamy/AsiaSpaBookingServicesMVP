//
//  LoginApiInteractor.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 22/01/2021.
//  Copyright © 2021 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginApiInteractor {

    func getIsoId(completion : @escaping (ISOIDModel?,ConfirmPhoneError? ,Error?)->()){
        guard let url = URL(string: URLs.isoURL ) else {print("error in isoURL");return }
        APIServices.instance.getData(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headers: nil) { (response : ISOIDModel?, responseError : ConfirmPhoneError?, error) in
            if let response = response{
                completion(response,nil,nil)
            }else if let responseError = responseError{
                completion(nil,responseError,nil)
            }else{
                completion(nil,nil,error)
            }
        }
    }

    
    func loginApi(phone:String, password: String, completion : @escaping ( Login?,LoginErrorModel? ,Error?)->()) {
        
        let lang = Language.currentLanguage()
        let deviceType = "ios"
        let deviceId = "qwekjqwekanxckippawqyqwrytfhgfytafdasfdzcnjtaswq"
        guard let isoID = Helper.getApiIsoID() else { return}
        
        let paramters = ["phone" : phone , "password" : password,"lang" : lang ,"device_id" : deviceId , "device_type" : deviceType , "iso_id" : isoID ] as [String : Any]
        
        print(paramters)
        guard let url = URL(string: URLs.loginURL ) else {
            print("error in loginURL")
            return
        }
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { (loginModel : Login?, loginErrorModel : LoginErrorModel?, error) in
            if let error = error {
                // network error
                print(error.localizedDescription)
                completion(nil , nil ,error)
            } else if let baseErrorModel = loginErrorModel {
                completion(nil , baseErrorModel,nil)
            }else{
                guard let loginModel = loginModel else { return }
                completion(loginModel , nil ,nil)
            }
        }
    }
}
