//
//  LoginPresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    weak var loginPro : LoginProtocol?
    var isoIDArr = [Int]()
    var isoNameArr = [String]()
    var loginApiIntcator = LoginApiInteractor()
    
    init(login : LoginProtocol) {
        self.loginPro = login
    }
    
    
    
    func getIsoIdData(){
        loginApiIntcator.getIsoId(completion: { [weak self](iSOIDModel, confirmPhoneError, error) in
            guard let self = self else {return}
            if let isoIdData = iSOIDModel?.data{
                for i in isoIdData{
                    self.isoIDArr.append(i.id)
                    self.isoNameArr.append(i.name)
                    Helper.saveIsoID(isoID: i.id)
                }
            }else if let responseError = confirmPhoneError{
                DispatchQueue.main.async {
                    self.loginPro?.fireCustomError(msg: responseError.msg ?? "")
                }
            }else{
                DispatchQueue.main.async {
                    self.loginPro?.fireCustomError(msg: error?.localizedDescription ?? "")
                }
            }
            DispatchQueue.main.async {
                self.loginPro?.reloadData()
            }
        })
    }
    
    func getLoginApiData(){
        guard let phone = loginPro?.getPhone() , let password = loginPro?.getPassword() else { return }
        loginApiIntcator.loginApi(phone: phone, password: password, completion: { [weak self](responseLogin, loginErrorModel, error) in
            guard let self = self else {return}
            if let error = error{
                DispatchQueue.main.async {
                    self.loginPro?.fireCustomError(msg: error.localizedDescription)
                }
            }else if let responseError = loginErrorModel{
                let errorMsg = responseError.msg
                DispatchQueue.main.async {
                    self.loginPro?.fireCustomError(msg: errorMsg)
                }
            }else{
                guard let userID = responseLogin?.data.id else { return }
                Helper.saveID(id: userID)
                self.loginPro?.pushViewController()
            }
        })
    }
}
