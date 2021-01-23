//
//  SingleEmployee.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 2/12/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation

// MARK: - SinglEmployeeModel
struct SinglEmployeeModel: Codable {
    let key, value: String
    let data: SinglEmployeeModelData
}

// MARK: - DataClass
struct SinglEmployeeModelData: Codable {
    let id: Int
    let name: String
    let image: String
    let rate: Double
    let ratesCount: Int
    let reviews: [Review]

    enum CodingKeys: String, CodingKey {
        case id, name, image, rate
        case ratesCount = "rates_count"
        case reviews
    }
}

// MARK: - Review
struct Review: Codable {
    let id, rate: Int
    let comment, createdAt: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case id, rate, comment
        case createdAt = "created_at"
        case user
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name: String
    let avatar: String
}
