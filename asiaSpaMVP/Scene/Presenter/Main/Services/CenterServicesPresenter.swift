//
//  CenterServicesPresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CenterServicesPresenter{
    
    weak var centerServicesPro : CenterServicesProtocol?
    var servicesCenterVisitModel : ServicesCenterVisitModel?
    var servicesDataArr = [CodeDataModel]()
    var servicesID = [Int]()
    var serviceString = [String]()
    var typeService = ""
    var centerVisitDataArr = [CenterVisitOrdersubservicesarr]()
    var subserviceNameArr = [String]()
    var dateArr = [String]()
    var timeArr = [String]()
    var employeeNameArr = [String]()
    var cuponString = ""
    
    init(service : CenterServicesProtocol ) {
        self.centerServicesPro = service
    }
    
    // MARK:- API
    
    func getData(type: String){
        guard let userID = Helper.getApiID() else{return}
        let lang = Language.currentLanguage()
        let paramters = [
            "lang": lang , "type" : type , "user_id" : userID] as [String : Any]
        print(paramters)
        guard let url = URL(string: URLs.servicesURL ) else {
            print("error in servicesURL")
            return
        }
        AF.request(url, method: .post, parameters: paramters)
            .responseJSON(completionHandler: {(response) in
                do{
                    let registerJson = try JSONDecoder().decode(ServicesCenterVisitModel.self, from: response.data ?? Data())
                    print(registerJson)
                    self.servicesCenterVisitModel = registerJson
                    for i in registerJson.ordersubservicesarr ?? []{
                        self.subserviceNameArr.append(i.subserviceName ?? "")
                        self.timeArr.append(i.time ?? "")
                        self.dateArr.append(i.day ?? "")
                        self.employeeNameArr.append(i.employee?.name ?? "")
                    }
                    self.centerServicesPro?.reloadTableViewData()
                }catch{}
                
                print("URL : \(url)")
                switch response.result{
                case .failure( _):
                    guard let error = response.error else { return }
                    self.centerServicesPro?.fireErrorAction(errorMsg: error.localizedDescription)
                    
                case .success(let value):
                    let json = JSON(value)
                    print("response : \(response)")
                    guard let dataArr = json["data"].array else {
                        return
                    }
                    print("DATA = \(dataArr)")
                    for data in dataArr{
                        if let data = data.dictionary, let serviceaData =  CodeDataModel.init(dict: data)  {
                            self.servicesDataArr.append(serviceaData)
                        }
                    }
                    print(self.servicesDataArr.count)
                    for _ in 0..<self.servicesDataArr.count {
                        for i in self.servicesDataArr {
                            self.servicesID.append(i.id ?? 0)
                            self.serviceString.append(i.name ?? "")
                            Helper.saveServicesID(servicesID: i.id ?? 0)
                        }
                    }
                    print("............")
                }
                print("\(self.servicesID) \n \(self.serviceString)")
                self.centerServicesPro?.reloadCollectionViewData()
            })
    }
    
    @objc func gotoBillVC(sender : UITapGestureRecognizer) {
        self.centerServicesPro?.gotoBillVC()
    }
    
    @objc func gotoMainVC(sender : UITapGestureRecognizer) {
        self.centerServicesPro?.gotoMainVC()
    }
    
}
