//
//  SingleOrdermodel.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 2/21/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
// MARK: - SingleOrdersModel
struct SingleOrdersModel: Codable {
    let key, value: String?
    let data: SingleOrdersData?
}

// MARK: - DataClass
struct SingleOrdersData: Codable {
    let id: Int?
    let qr: String?
    let page: String?
    let type: String?
    let discount ,totalPrice , addTax: Double?
    let price, comission: Int?
    let paymentStatus, paymentType: String?
    let copounID: Int?
    let ordersubservicesarr: [SingleOrdersubservicesarr]?

    enum CodingKeys: String, CodingKey {
        case id, qr, page, type, price, discount, comission
        case totalPrice = "total_price"
        case paymentStatus = "payment_status"
        case paymentType = "payment_type"
        case addTax = "add_tax"
        case copounID = "copoun_id"
        case ordersubservicesarr
    }
}

// MARK: - Ordersubservicesarr
struct SingleOrdersubservicesarr: Codable {
    let id, subserviceID: Int?
    let subserviceName: String?
    let totalPrice ,discount: Double?
    let price : Int?
    let day, date2, time, status: String?
    let type: String?
    let employee: SingleOrderEmployee?

    enum CodingKeys: String, CodingKey {
        case id
        case subserviceID = "subservice_id"
        case subserviceName = "subservice_name"
        case price, discount
        case totalPrice = "total_price"
        case day, date2, time, status, type, employee
    }
}

// MARK: - Employee
struct SingleOrderEmployee: Codable {
    let id: Int?
    let name: String?
    let image: String?
}
