//
//  MainPresenter.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 05/12/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class MainPresenter {
    
    weak var mainPro : MainProtocol?
    
    init(pro : MainProtocol) {
        self.mainPro = pro
    }
    
    
    //MARK:-  ------- API ------
    func getData(lang : String?){
        guard let userId = Helper.getApiID() else {return}
        guard let lang = lang else {return}
        
        let paramters = ["user_id" : userId , "lang" : lang] as [String : Any]
        print(paramters)
        
        guard let url = URL(string: URLs.langURL ) else {
            print("error in langURL")
            return
        }
        
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : LangModel?, errorRes : ConfirmPhoneError?, error) in
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
            }else if let errorRes = errorRes{
                print(errorRes.msg ?? "")
            }else{
                print(response?.value ?? "")
                guard let currentLang = response?.lang else {return}
                Language.setAppLanguage(lang: currentLang)
                print(Language.currentLanguage())
            }
        }
    }
}
