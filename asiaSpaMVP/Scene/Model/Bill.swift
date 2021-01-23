//
//  Bill.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 2/23/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation

// MARK: - BillModel
struct BillModel: Codable {
    let key, value: String?
    let data: BillData?
}

// MARK: - DataClass
struct BillData: Codable {
    let id ,comission ,price: Int?
    let type: String?
    let  discount, totalPrice,addTax: Double?
    let paymentStatus: String?
    let copounID: Int?
    let ordersubservicesarr: [BillOrdersubservicesarr]?

    enum CodingKeys: String, CodingKey {
        case id, type, price, discount, comission
        case totalPrice = "total_price"
        case paymentStatus = "payment_status"
        case copounID = "copoun_id"
        case addTax = "add_tax"
        case ordersubservicesarr
    }
}

// MARK: - Ordersubservicesarr
struct BillOrdersubservicesarr: Codable {
    let id, subserviceID ,price: Int?
    let subserviceName: String?
    let  discount, totalPrice: Double?
    let day, time, status, type: String?
    let employee: BillEmployee?

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
struct BillEmployee: Codable {
    let id: Int?
    let name: String?
    let image: String?
}

//MARK:- = DeletOrder
struct DeletOrder: Codable {
    let key: String?
    let value: String?
    let msg: String?
}
