//
//  ConfirmedBookingPresenter.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 21/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Alamofire
import UIKit

class ConfirmedBookingPresenter {
    
    weak var confirmedBookingProtocol : ConfirmedBookingProtocol?
    var singleOrdersModel : SingleOrdersModel?
    var subserviceNameArr = [String]()
    var dateArr = [String]()
    var timeArr = [String]()
    var priceArr = [Int]()
    var orderID = 0
    var deletOrderApi : DeletOrder?
    
    init(pro : ConfirmedBookingProtocol ) {
        self.confirmedBookingProtocol = pro
    }
    
    @objc func goToMain(sender:UITapGestureRecognizer){
        confirmedBookingProtocol?.goToMainVC()
    }
    
    @objc func goToPrint(sender:UITapGestureRecognizer){
        confirmedBookingProtocol?.goToPrintVC()
    }
    
    @objc func goToAccount(sender:UITapGestureRecognizer){
        confirmedBookingProtocol?.goToAccountVC()
    }
    
    /// API
    func getData(orderID : Int) {
        
        /// OrderApi
        let lang = "en"
        guard let userID = Helper.getApiID() else { return }
        let paramter = ["user_id" : userID ,"lang" : lang] as [String : Any]
        guard let urll = URL(string: URLs.ordersURL ) else {
            print("error in ordersURL")
            return
        }
        APIServices.instance.getData(url: urll, method: .post, params: paramter, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : OrdersModel?, respError : ConfirmPhoneError?, error ) in
            guard let self = self else {return}
            
            if let error = error{
                self.confirmedBookingProtocol?.fireErrorAction(msg: error.localizedDescription)
            }else if let respError = respError{
                guard let msg = respError.msg else { return }
                self.confirmedBookingProtocol?.fireErrorAction(msg: msg)
            }else{
                //orderID = response?.data.
            }
        }
        
        //////////////////////////////////////////////////////
        let paramters = ["order_id" : orderID ,"lang" : lang] as [String : Any]
        
        guard let url = URL(string: URLs.singleOrderURL ) else {
            print("error in singleOrderURL")
            return
        }
        
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : SingleOrdersModel?, respError : ConfirmPhoneError?, error ) in
            guard let self = self else {return}
            
            if let error = error{
                self.confirmedBookingProtocol?.fireErrorAction(msg: error.localizedDescription)
            }else if let respError = respError{
                guard let msg = respError.msg else { return }
                self.confirmedBookingProtocol?.fireErrorAction(msg: msg)
            }else{
                self.singleOrdersModel = response
                guard let data = response?.data?.ordersubservicesarr else { return }
                for i in data {
                    self.subserviceNameArr.append(i.subserviceName ?? "")
                    self.timeArr.append(i.time ?? "")
                    self.dateArr.append(i.day ?? "")
                    self.priceArr.append(i.price ?? 0)
                }
                DispatchQueue.main.async {
                    self.confirmedBookingProtocol?.getPrice(price: "\( response?.data?.price ?? 0)")
                    self.confirmedBookingProtocol?.getTotalPrice(price: "\(self.singleOrdersModel?.data?.totalPrice ?? 0)")
                    self.confirmedBookingProtocol?.getDiscount(price:  "\(self.singleOrdersModel?.data?.discount ?? 0)")
                    self.confirmedBookingProtocol?.reloadTableViewData()
                }
            }
        }
    }
}
