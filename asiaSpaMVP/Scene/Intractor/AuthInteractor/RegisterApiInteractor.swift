//
//  RegisterApiInteractor.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 23/01/2021.
//  Copyright © 2021 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import Alamofire

class RegisterApiInteractor{
    
    func registerApi(email : String ,name : String ,phone:String, password: String, completion : @escaping ( Register?,RegisterError? ,Error?)->()) {
        
        let lang = Language.currentLanguage()
        let deviceType = "ios"
        let deviceId = "qwekjqwekanxckippawqyqwrytfhgfytafdasfdzcnjtaswq"
        guard let isoID = Helper.getApiIsoID() else { return}
        
        let paramters = ["name" : name , "email" : email,"phone" : phone , "password" : password,"lang" : lang ,"device_id" : deviceId , "device_type" : deviceType , "iso_id" : isoID ] as [String : Any]
        
        print(paramters)
        guard let url = URL(string: URLs.registerURL ) else {
            print("error in registerURL")
            return
        }
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { (registerModel : Register?, registerErrorModel : RegisterError?, error) in
            if let error = error {
                // network error
                print(error.localizedDescription)
                completion(nil , nil ,error)
            } else if let registerErrorModel = registerErrorModel {
                completion(nil , registerErrorModel,nil)
            }else{
                guard let registerModel = registerModel else { return }
                completion(registerModel , nil ,nil)
            }
        }
    }
}
