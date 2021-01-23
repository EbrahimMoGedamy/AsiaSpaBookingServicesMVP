//
//  MassagePresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/21/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class MassagePresenter{
    
    weak var massagePro : MassageProtocol?
    var userdata : SubServicesDataModel?
    var servicsData : [ServiceData] = []
    var tableServiceData : [Subservice] = []
    var singleSubService : SingleSubservice?
    var orderSubservicesArr : [Ordersubservicesarr] = []
    
    init(massage : MassageProtocol) {
        self.massagePro = massage
    }
    
    //MARK:-  ------- API ------
    func getData(id : Int , type : String){
        let userId = Helper.getApiID()
        let lang = Language.currentLanguage()
        
        let paramters = ["service_id" : id , "type" : type ,
                         "user_id" : userId ?? 0 , "lang" : lang] as [String : Any]
        print(paramters)
        
        guard let url = URL(string: URLs.subServicesURL ) else {
            print("error in subServicesURL")
            return
        }
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : SubServicesDataModel?, serviceError : ServicesErrorModel?, error) in
            guard let self = self else {return}
            if let error = error {
                self.massagePro?.fireErrorAction(errorMsg: error.localizedDescription)
            }else if let serviceError = serviceError{
                self.massagePro?.fireErrorAction(errorMsg: serviceError.msg ?? "")
            }else{
                for i in response?.services ?? []{
                    self.servicsData.append(i)
                }
                for i in response?.subservices ?? []{
                    self.tableServiceData.append(i)
                }
                self.massagePro?.reloadCollectionViewData()
                self.massagePro?.servicesTableViewData()
                self.massagePro?.unPaidServicesTableViewData()
            }
        }
    }
    //    func servicesApi (id : Int , type : String) {
    //        let userId = Helper.getApiID()
    //        let lang = "en"
    //
    //        let paramters = ["service_id" : id , "type" : type ,
    //                         "user_id" : userId ?? 0 , "lang" : lang] as [String : Any]
    //        print(paramters)
    //
    //        guard let url = URL(string: URLs.subServicesURL ) else {
    //            print("error in subServicesURL")
    //            return
    //        }
    //        AF.request(url, method: .post, parameters: paramters)
    //            .responseJSON(completionHandler: {  (response) in
    //                print("URL : \(url)")
    ////                print(String(data: response.data!, encoding:.utf8)!)
    //                do{
    //                    let jsonData = try JSONDecoder().decode(SubServicesDataModel.self, from: response.data! )
    //
    //                    for i in jsonData.services{
    //                        self.servicsData.append(i)
    //                    }
    //                    for i in jsonData.subservices{
    //                        self.tableServiceData.append(i)
    //                    }
    //
    //                    self.massagePro?.reloadCollectionViewData()
    //                    self.massagePro?.servicesTableViewData()
    //
    //                }catch{}
    //            }
    //        )}
}
