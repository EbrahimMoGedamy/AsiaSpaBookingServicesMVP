//
//  SingleService.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 12/22/19.
//  Copyright © 2019 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation

// MARK: - SingleSubServiceModel
struct SingleSubServiceModel: Codable {
    let key, value: String?
    let employees: [EmployeeSingleSubService]?
    let days: [Day]?
    let times: [Time]?
}

// MARK: - Day
struct Day: Codable {
    let id: Int?
    let dayKey, name, date1, date2: String?
    let available: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case dayKey = "day_key"
        case name, date1, date2, available
    }
}

// MARK: - Employee
struct EmployeeSingleSubService : Codable {
    let id: Int?
    let name: String?
    let image: String?
    let rate: Double?
    let ratesCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, image, rate
        case ratesCount = "rates_count"
    }
}

// MARK: - Time
struct Time: Codable {
    let id: Int?
    let time: String?
    let discount, available: Int?
}
