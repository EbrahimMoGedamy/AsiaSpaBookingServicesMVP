//
//  VerificationCodePresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class VerificationCodePresenter {
    
    weak var verificationCodePro : VerificationCodeProtocol?
    var verificationCodeModel : ConfirmPhone?
    
    init(vcode : VerificationCodeProtocol) {
        self.verificationCodePro = vcode
    }
    
    var msgError = ""
    
    func viewDidLoad(){
        getData { [weak self](error, success) in
            guard let self = self else {return}
            if error != nil{
                print("wrong verification code.")
            }else{
                self.verificationCodePro?.pushViewController()
            }
        }
    }
    
    //Mark :- Api
    func getData(completion : @escaping ( _ error : Error? , _ success : Bool)->Void){
        let lang = "en"
        guard let userID = Helper.getApiID() else { return}
        guard let vcode = verificationCodePro?.getVcode() else { return }
        
        let paramters = ["lang" : lang , "user_id" : userID ,"v_code" : vcode ] as [String : Any]
        print(paramters)
        guard let url = URL(string: URLs.confirmPhoneURL ) else {
            print("error in confirmPhoneURL")
            return
        }
        
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (confirmPhoneModel: ConfirmPhone?, confirmPhoneError: ConfirmPhoneError?, error)  in
            guard let self = self else {return}
            if let error = error {
                // network error
                print(error.localizedDescription)
                completion(error , false)
            } else if let confirmError = confirmPhoneError {
                print(confirmError.msg ?? "")
                self.msgError = confirmError.msg ?? ""
                completion(error , false)
            }else{
                guard let confirmPhoneModel = confirmPhoneModel else {return }
                
                
                
                completion(nil , true)
            }
        }
    }
    func verificationCodeApi(completion : @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let lang = "en"
        guard let userID = Helper.getApiID() else { return}
        guard let vcode = verificationCodePro?.getVcode() else { return }
        
        let paramters = ["lang" : lang , "user_id" : userID ,"v_code" : vcode ] as [String : Any]
        print(paramters)
        guard let url = URL(string: URLs.confirmPhoneURL ) else {
            print("error in confirmPhoneURL")
            return
        }
        AF.request(url, method: .post, parameters: paramters)
            .responseJSON(completionHandler: {  (response) in
                print("URL : \(url)")
                print("response.data")
                print(String(data: response.data!, encoding:.utf8)!)
                do{
                    let jsonData = try JSONDecoder().decode(ConfirmPhone.self, from: response.data! )
                    print(jsonData)
                    
                    completion(nil , true)
                }catch{
                    completion(error , false)
                    print(error)
                }
            }
            )}
}
