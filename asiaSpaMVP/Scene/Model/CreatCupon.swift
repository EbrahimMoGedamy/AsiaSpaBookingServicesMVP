//
//  CreatCupon.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 2/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
// MARK: - CreatCuponModel
struct CreatCuponModel: Codable {
    let key, value, msg: String
    let data: CreatCuponData
}

// MARK: - DataClass
struct CreatCuponData: Codable {
    let id: Int
    let code, phone, userName, notes: String
    let order: CreatCuponOrder

    enum CodingKeys: String, CodingKey {
        case id, code, phone
        case userName = "user_name"
        case notes, order
    }
}

// MARK: - Order
struct CreatCuponOrder: Codable {
    let id: Int
    let type: String
    let price, discount, comission, totalPrice: Int
    let paymentStatus: String
    let copounID: Int
    let ordersubservicesarr: [CreatCuponOrdersubservicesarr]

    enum CodingKeys: String, CodingKey {
        case id, type, price, discount, comission
        case totalPrice = "total_price"
        case paymentStatus = "payment_status"
        case copounID = "copoun_id"
        case ordersubservicesarr
    }
}

// MARK: - Ordersubservicesarr
struct CreatCuponOrdersubservicesarr: Codable {
    let id, subserviceID: Int
    let subserviceName: String
    let price, discount, totalPrice: Int
    let day, time, status, type: String
    let employee: CreatCuponEmployee

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
struct CreatCuponEmployee: Codable {
    let id: Int
    let name: String
    let image: String
}
