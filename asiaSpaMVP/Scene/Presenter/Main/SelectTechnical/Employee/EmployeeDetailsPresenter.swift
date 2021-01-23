//
//  EmployeeDetailsPresenter.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 20/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

class EmployeeDetailsPresenter {
    
    weak var employeeDetailsPro : EmployeeDetailsProtocol?
//    weak var employeeDetailsProto : EmployeeTableViewCellProtocol?
    var singleEmployeeModel : SinglEmployeeModel?
    var reviewsArr = [Review]()
    
    init(emp : EmployeeDetailsProtocol) {
        self.employeeDetailsPro = emp
    }
    
//    init?(emp : EmployeeTableViewCellProtocol) {
//        self.employeeDetailsProto = emp
//    }
    
    @objc func goToMyAccount(sender:UITapGestureRecognizer){
        employeeDetailsPro?.moveToMyAccount()
    }
    
    func getData(id : Int){
        let lang = "en"
        guard let url = URL(string: URLs.singleEmployeeURL ) else {
            print("error in singleEmployeeURL")
            return
        }
        
        let paramters = ["lang" : lang , "employee_id" : id ] as [String : Any]
        print(paramters)
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self] (response : SinglEmployeeModel?, responseError : ConfirmPhoneError?, error) in
            guard let self = self else {return}
            if let error = error{
                self.employeeDetailsPro?.fireErrorAction(msg: error.localizedDescription)
            }else if let responseError = responseError{
                self.employeeDetailsPro?.fireErrorAction(msg: responseError.msg ?? "")
            }else{
                self.singleEmployeeModel = response
                for i in response?.data.reviews ?? []{
                    self.reviewsArr.append(i)
                }
                print(response!)
                guard let imgURL = URL(string: response?.data.image ?? "") else {return}
                AF.request(imgURL, method: .get).responseImage { (resp) in
                    if case .success(let image) = resp.result {
                        DispatchQueue.main.async {
                            self.employeeDetailsPro?.getImage(img: image)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.employeeDetailsPro?.getTechName(techName: response?.data.name ?? "")
                    self.employeeDetailsPro?.getRateCount(rateeCount: response?.data.ratesCount ?? 0)
                    self.employeeDetailsPro?.getRate(ratee: response?.data.rate ?? 0.0)
                    self.employeeDetailsPro?.reloadEmployeTableView()
                }
                
            }
        }
    }
}
