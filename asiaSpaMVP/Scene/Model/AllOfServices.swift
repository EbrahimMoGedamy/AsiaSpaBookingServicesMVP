//
//  AllOfServices.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 12/4/19.
//  Copyright © 2019 Ebrahim  Mo Gedamy. All rights reserved.
//
import Foundation

// MARK: - SubServicesDataModel
struct SubServicesDataModel: Codable {
    let key, value: String?
    let services: [ServiceData]?
    let subservices: [Subservice]?
    let singleSubservice: SingleSubservice?
    let ordersubservicesarr: [Ordersubservicesarr]?
}

// MARK: - Ordersubservicesarr
struct Ordersubservicesarr: Codable {
    let id, subserviceID: Int?
    let subserviceName: String?
    let price: Int?
    let discount, totalPrice: Double?
    let day, time, status, type: String?
    let employee: Employee?

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
struct Employee: Codable {
    let id: Int?
    let name: String?
    let image: String?
}

// MARK: - Service
struct ServiceData: Codable {
    let id: Int
    let name: String
    let selected: Int
}

// MARK: - SingleSubservice
struct SingleSubservice: Codable {
    let id, price: Int?
    let image: String?
    let name, desc: String?
}

// MARK: - Subservice
struct Subservice: Codable {
    let id: Int?
    let name: String?
}

