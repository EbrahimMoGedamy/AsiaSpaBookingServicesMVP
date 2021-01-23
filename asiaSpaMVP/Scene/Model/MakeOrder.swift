//
//  MakeOrder.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 2/14/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation

// MARK: - MakeOrderModel
struct MakeOrderModel: Codable {
    let key, value ,msg: String?
    let orderID, ordersubsericeID, ordersubservicesCount: Int?

    enum CodingKeys: String, CodingKey {
        case key, value
        case orderID = "order_id"
        case ordersubsericeID = "ordersubserice_id"
        case ordersubservicesCount = "ordersubservices_count"
        case msg
    }
}
