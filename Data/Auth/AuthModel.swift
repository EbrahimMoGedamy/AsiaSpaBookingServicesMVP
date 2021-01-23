//
//  AuthModel.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - Register
struct Register: Codable {
    var key, value, msg: String?
    var data: RegisterData?
}

// MARK: - RegisterData
struct RegisterData: Codable {
    var userID: Int?
    var vCode: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case vCode = "v_code"
    }
}

struct RegisterError : Codable{
    
    var key , value , msg: String?
    
}

// MARK: -------------------------



//class IsoModel: NSObject {
//
//    var id : Int
//    var name : String
//
//     init?(dict:[String : JSON]){
//         let id = dict["id"]?.int
//         let name = dict["name"]?.string
//         self.id = id ?? 0
//         self.name = name ?? ""
//     }
//
//}

import Foundation

// MARK: - ISOIDModel
struct ISOIDModel: Codable {
    let key, value: String
    let data: [ISOIDData]
}

// MARK: - Datum
struct ISOIDData: Codable {
    let id: Int
    let name: String
}


// MARK: - Login
struct Login: Codable {
    let key, value : String
    let data: LoginData
}

// MARK: - LoginData
struct LoginData: Codable {
    let id: Int
    let name: String
    let isoID: Int
    let iso, email, phoneWithoutISO, phone: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isoID = "iso_id"
        case iso, email
        case phoneWithoutISO = "phone_without_iso"
        case phone, avatar
    }
}
// MARK: - LoginFailedModel
struct LoginErrorModel: Codable {
    let key, value, msg: String
}

// MARK: - ConfirmPhone
struct ConfirmPhone: Codable {
    let key, value: String
    let data: ConfirmPhoneData
}

// MARK: - ConfirmPhoneData
struct ConfirmPhoneData: Codable {
    let id: Int
    let name: String
    let isoID: Int
    let iso, email, phoneWithoutISO, phone: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isoID = "iso_id"
        case iso, email
        case phoneWithoutISO = "phone_without_iso"
        case phone, avatar
    }
}

struct ConfirmPhoneError : Codable{
    
    var key , value , msg: String?
    
}


// MARK: - RecoverPassword
struct RecoverPassword: Codable {
    let key, value: String
    let data: RecoverPasswordData
}

// MARK: - RecoverPasswordData
struct RecoverPasswordData: Codable {
    let userID: Int
    let vCode: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case vCode = "v_code"
    }
}

// MARK: - ResetPassword
struct ResetPassword: Codable {
    let key, value, msg: String?
    
}

// MARK: - Logout
struct Logout: Codable {
    let key, value, msg: String?
    
}

// MARK: - ChangePassword
struct ChangePassword: Codable {
    let key, value, msg: String?
    
}

// MARK: - UpdateProfileModel
struct UpdateProfileModel: Codable {
    let key, value, msg: String
    let data: UpdateProfileModelData
}

// MARK: - DataClass
struct UpdateProfileModelData: Codable {
    let id: Int
    let name: String
    let isoID: Int
    let iso, email, phoneWithoutISO, phone: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isoID = "iso_id"
        case iso, email
        case phoneWithoutISO = "phone_without_iso"
        case phone, avatar
    }
}
