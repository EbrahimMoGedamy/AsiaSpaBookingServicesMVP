//
//  SelectTechnicalPresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class SelectTechnicalPresenter{
    
    weak var selectTechnicalPro : SelectTechnicalProtocol?
    
    init(technical : SelectTechnicalProtocol) {
        self.selectTechnicalPro = technical
    }
    
    var employee : [EmployeeSingleSubService] = []
    var day : [Day] = []
    var time : [Time] = []
    private let lang = "en"
    private let url = URL(string: URLs.singleSubServicesURL )
    var orderId = 0
    var orderSubsericeId = 0
//    var message = ""
    
    // MARK:- API
    func servicesApi(subserviceID : Int) {
        
        
        let paramters = [
            "lang": lang , "subservice_id" : subserviceID] as [String : Any]
        print(paramters)
        guard let url = URL(string: URLs.singleSubServicesURL ) else {
            print("error in servicesURL")
            return
        }
        AF.request(url, method: .post, parameters: paramters)
            .responseJSON(completionHandler: {(response) in
                do{
                    let jsonData = try JSONDecoder().decode(SingleSubServiceModel.self, from: response.data! )
                    for i in jsonData.employees ?? []{
                        self.employee.append(i)
                    }
                    
                    self.selectTechnicalPro?.reloadTechnicalCollectionView()
                }catch{}
                
            }
        )}
    
    func showDayApi(subserviceID : Int , empId : Int) {
        
        let paramters = [
            "lang": lang , "subservice_id" : subserviceID , "employee_id" : empId] as [String : Any]
        print(paramters)
        guard let url = self.url else {
            print("error in servicesURL")
            return
        }
        AF.request(url, method: .post, parameters: paramters)
            .responseJSON(completionHandler: {(response) in
                do{
                    let jsonData = try JSONDecoder().decode(SingleSubServiceModel.self, from: response.data! )
                    for i in jsonData.days ?? []{
                        self.day.append(i)
                    }
                    
                    self.selectTechnicalPro?.reloadDayCollectionView()
                }catch{}
                
            }
        )}
    
    func showTimeApi(subserviceID : Int , empId : Int , dayId : Int) {
        
        let paramters = [
            "lang": lang , "subservice_id" : subserviceID , "employee_id" : empId ,"day_id": dayId] as [String : Any]
        print(paramters)
        guard let url = self.url else {
            print("error in servicesURL")
            return
        }
        AF.request(url, method: .post, parameters: paramters)
            .responseJSON(completionHandler: {(response) in
                do{
                    let jsonData = try JSONDecoder().decode(SingleSubServiceModel.self, from: response.data! )
                    for i in jsonData.times ?? []{
                        self.time.append(i)
                    }
                    
                    self.selectTechnicalPro?.reloadTimeCollectionView()
                }catch{}
            }
        )}
    
    func makeOrderApi(subserviceID : Int , empId : Int , dayId : Int ,timeId :Int ,type : String ,dayKey :String ,date2 : String ) {
        
        guard let userId = Helper.getApiID() else { return }
        let paramters = ["user_id":userId,
                         "lang": lang , "subservice_id" : subserviceID , "employee_id" : empId ,"day_id": dayId ,"time_id" : timeId , "type" : type,"day_key" : dayKey , "date2": date2] as [String : Any]
        print(paramters)
        guard let url = URL(string: URLs.makeOrderURL) else {
            print("error in servicesURL")
            return
        }
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : MakeOrderModel? , responseError : ConfirmPhoneError?, error) in
            guard let self = self else {return}
            guard let msg = response?.msg else { return }
            guard let key = response?.key else {return}
            if let error = error {
                // network error
                print(error.localizedDescription)
                self.selectTechnicalPro?.fireFailPopup(msg: error.localizedDescription)
            }
            
            switch key {
            case "success":
                guard let response = response else { return }
                self.orderId = response.orderID ?? 0
                self.orderSubsericeId = response.ordersubsericeID ?? 0
                DispatchQueue.main.async {
                    self.selectTechnicalPro?.fireSuccessPopup(msg:msg )
                }
            case "fail":
                DispatchQueue.main.async {
                    self.selectTechnicalPro?.fireFailPopup(msg: msg)
                }
            default:
                print("")
            }
        }
//        AF.request(url, method: .post, parameters: paramters)
//            .responseJSON(completionHandler: { [weak self](response) in
//                do{
//                    guard let self = self else {return}
//                    let jsonData = try JSONDecoder().decode(MakeOrderModel.self, from: response.data! )
//                    print(jsonData)
//                    self.orderId = jsonData.orderID ?? 0
//                    self.orderSubsericeId = jsonData.ordersubsericeID ?? 0
//                    let message = jsonData.msg ?? ""
//                    self.selectTechnicalPro?.fireSuccessPopup(msg: message)
//                }catch{
//                    //self?.selectTechnicalPro?.fireFailPopup(msg: mess)
//                }
//            }
//        )
    }
}
