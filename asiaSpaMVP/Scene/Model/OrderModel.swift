//
//  OrderModel.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 2/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - OrdersModel
struct OrdersModel: Codable {
    let key, value: String
    let data: [OrdersModelData]
}

// MARK: - Datum
struct OrdersModelData: Codable {
    let id: Int
    let type: VisitTypeOrderModel
    let price: Int
    let discount: Double
    let comission: Int
    let totalPrice: Double
    let paymentStatus: PaymentStatus
    let copounID: Int
    let ordersubservicesarr: [SubservicesArrOrdersData]

    enum CodingKeys: String, CodingKey {
        case id, type, price, discount, comission
        case totalPrice = "total_price"
        case paymentStatus = "payment_status"
        case copounID = "copoun_id"
        case ordersubservicesarr
    }
}

// MARK: - Ordersubservicesarr
struct SubservicesArrOrdersData: Codable {
    let id, subserviceID: Int
    let subserviceName: String
    let price, discount, totalPrice: Int
    let day, time, status: String
    let type: VisitTypeOrderModel
    let employee: EmployeeOrdersModel

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
struct EmployeeOrdersModel: Codable {
    let id: Int
    let name: String
    let image: String
}

enum VisitTypeOrderModel: String, Codable {
    case visit = "visit"
}

enum PaymentStatus: String, Codable {
    case thePaymentWasMade = "The payment was made"
}
