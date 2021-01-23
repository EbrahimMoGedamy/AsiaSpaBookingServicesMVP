//
//  PaymentModel.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 3/4/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
enum PaymentType : String {
    case cash = "cash"
    case atm = "atm"
    case wallet = "wallet"
}

struct PaymentModel : Codable {
    let key, value, msg: String?
}
