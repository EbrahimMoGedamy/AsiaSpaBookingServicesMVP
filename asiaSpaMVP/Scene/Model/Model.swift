//
//  Model.swift
//  AsiaSpa
//
//  Created by Ebrahim  Mo Gedamy on 11/15/19.
//  Copyright © 2019 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import SwiftyJSON


// MARK: ------ Wallet
struct Wallet: Codable {
    let key, value : String
    let data: Int
}

// MARK: ------ PointsModel
struct PointsModel: Codable {
    let key, value : String
    let data: Int
}

// MARK:- ConvertPointsIntoWalletModel
struct ConvertPointsIntoWalletModel: Codable {
    let key, value , msg: String
}

// MARK: - Contantlocation
struct Contantlocation: Codable {
    let key, value: String
    var data: ContantlocationData
}

// MARK: - ContantlocationData
struct ContantlocationData: Codable {
    var instagram, twitter, youtube,facebook, snapchat, email,address, phone: String
    var lat, lng : String?
}







