//
//  CodeDataModel.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 12/1/19.
//  Copyright © 2019 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import SwiftyJSON

// MARK:-  Services
class CodeDataModel: NSObject {

    var id : Int?
    var name : String?
    
     init?(dict:[String : JSON]){
        let id = dict["id"]?.int
        let name = dict["name"]?.string
        self.id = id ?? 0
         self.name = name ?? ""
     }
}
// MARK: - ServicesModel
struct ServicesCenterVisitModel: Codable {
    let key, value: String?
    let data: [Datum]?
    let ordersubservicesarr: [CenterVisitOrdersubservicesarr]?
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Ordersubservicesarr
struct CenterVisitOrdersubservicesarr: Codable {
    let id, subserviceID: Int?
    let subserviceName: String?
    let price, discount, totalPrice: Int?
    let day, time, status, type: String?
    let employee: CenterVisitEmployee?

    enum CodingKeys: String, CodingKey {
        case id
        case subserviceID = "subservice_id"
        case subserviceName = "subservice_name"
        case price, discount
        case totalPrice = "total_price"
        case day, time, status, type, employee
    }
}

// MARK: - Employee
struct CenterVisitEmployee: Codable {
    let id: Int?
    let name: String?
    let image: String?
}
struct ServicesErrorModel: Codable {
    let key, value, msg: String?
}
