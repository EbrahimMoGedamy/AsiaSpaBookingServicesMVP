//
//  SingleCuponModel.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 3/3/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
// MARK: - SingleCuponModel
struct SingleCuponModel: Codable {
    let key, value: String
    let data: SingleCuponModelData
}

// MARK: - DataClass
struct SingleCuponModelData: Codable {
    let id: Int
    let page: String
    let code, phone, userName, notes: String
    let order: SingleCuponModelOrder

    enum CodingKeys: String, CodingKey {
        case id, page, code, phone
        case userName = "user_name"
        case notes, order
    }
}

// MARK: - Order
struct SingleCuponModelOrder: Codable {
    let id: Int
    let qr: String
    let type: String
    let price, discount, comission, totalPrice: Int
    let paymentStatus: String
    let copounID: Int
    let ordersubservicesarr: [SingleCuponOrdersubservicesarr]

    enum CodingKeys: String, CodingKey {
        case id, qr, type, price, discount, comission
        case totalPrice = "total_price"
        case paymentStatus = "payment_status"
        case copounID = "copoun_id"
        case ordersubservicesarr
    }
}

// MARK: - Ordersubservicesarr
struct SingleCuponOrdersubservicesarr: Codable {
    let id, subserviceID: Int
    let subserviceName: String
    let price, discount, totalPrice: Int
    let day, date2, time, status: String
    let type: String
    let employee: SingleCuponEmployee

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
struct SingleCuponEmployee: Codable {
    let id: Int
    let name: String
    let image: String
}
