//
//  BillPresenter.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 18/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class BillPresenter {
    
    weak var billProtocol : BillProtocol?
    var billModel : BillModel?
    var subserviceNameArr = [String]()
    var dateArr = [String]()
    var timeArr = [String]()
    var priceArr = [Int]()
    var deletOrderApi : DeletOrder?
    
    init(service : BillProtocol ) {
        self.billProtocol = service
    }
    
    @objc func goToMain(sender:UITapGestureRecognizer){
        billProtocol?.moveToMain()
    }
    
    /// API
    func getData() {
        
        let lang = "en"
        guard let userId = Helper.getApiID() else { return}
        let paramters = ["lang" : lang , "user_id" : userId] as [String : Any]
        
        guard let url = URL(string: URLs.billURL ) else {
            print("error in billURL")
            return
        }
        
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) {[weak self] (response : BillModel?, billError : ConfirmPhoneError?, error) in
            guard let self = self else {return}
            
            if let error = error {
                self.billProtocol?.fireErrorAction(msg: error.localizedDescription)
            }else if let billError = billError {
                guard let msg = billError.msg else { return }
                self.billProtocol?.fireErrorAction(msg: msg)
            }else{
                self.billModel = response
                guard let data = response?.data?.ordersubservicesarr else { return }
                for i in data {
                    self.subserviceNameArr.append(i.subserviceName ?? "")
                    self.timeArr.append(i.time ?? "")
                    self.dateArr.append(i.day ?? "")
                    self.priceArr.append(i.price ?? 0)
                }
                DispatchQueue.main.async {
                    self.billProtocol?.setPriceLbl(text: "\( response?.data?.price ?? 0)")
                    self.billProtocol?.setTotalPriceLbl(text: "\(self.billModel?.data?.totalPrice ?? 0)")
                    self.billProtocol?.setDiscountLbl(text: "\(self.billModel?.data?.discount ?? 0)")
                    self.billProtocol?.reloadTableViewData()
                }
            }
        }
    }
}


