//
//  RegisterPresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class RegisterPresenter {
    
    private weak var registerPro : RegisterProtocol?
    private var registerApi = RegisterApiInteractor()
    private var loginApi = LoginApiInteractor()
    
    var vcode = ""
    var isoIDArr = [Int]()
    var isoNameArr = [String]()
    private var msgSuccess = ""
    
    init(register : RegisterProtocol) {
        self.registerPro = register
    }
    
    // MARK:- func of register action
    func getIsoId() {
        
        loginApi.getIsoId(completion: { [weak self](iSOIDModel, responseError, error) in
            guard let self = self else {return}
            if let isoIdData = iSOIDModel?.data{
                for i in isoIdData{
                    self.isoIDArr.append(i.id)
                    self.isoNameArr.append(i.name)
                    Helper.saveIsoID(isoID: i.id)
                }
            }else if let responseError = responseError{
                DispatchQueue.main.async {
                    self.registerPro?.fireErrorAction(errorMsg: responseError.msg ?? "")
                }
            }else{
                DispatchQueue.main.async {
                    self.registerPro?.fireErrorAction(errorMsg: error?.localizedDescription ?? "")
                }
            }
            DispatchQueue.main.async {
                self.registerPro?.reloadData()
            }
        })
    }
    
    func registerBu() {
        getData()
    }
    
    //MARK:- Api
    func getData(){
        
        registerApi.registerApi(email: registerPro?.getEmail() ?? "", name: registerPro?.getName() ?? "", phone: registerPro?.getMobile() ?? "", password: registerPro?.getPassword() ?? "", completion: { [weak self] (response, responseError, error) in
            guard let self = self else {return}
            if let error = error {
                self.registerPro?.fireErrorAction(errorMsg: error.localizedDescription)
            } else if let responseError = responseError {
                self.registerPro?.fireErrorAction(errorMsg: responseError.msg ?? "")
            }else{
                guard let response = response else { return }
                self.msgSuccess = response.msg ?? ""
                print(response.msg ?? "")
                var userId = response.data?.userID
                userId = response.data?.userID
                Helper.saveID(id: userId ?? 0)
                self.vcode = response.data?.vCode ?? ""
                print("vcode \(self.vcode)")
                self.registerPro?.fireSuccessAction(successMsg: response.msg ?? "")
            }
        })
    }
}
