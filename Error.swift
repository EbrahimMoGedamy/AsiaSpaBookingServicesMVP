//
//  Error.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation

enum AuthErrors: Error {
    
    case emptyName
    case emptyPhoneNumber
    case emptyEmail
    case emptyPassword
    case invalidEmail
    case invalidPhoneNumber
    case strongPasswprd
    case verficationCode
    case emptyConfirmPassword
    case matchPassword
    
    var errorDescription: String {
        
        switch self {
            
        case .emptyName:
         return "Please enter full name"
            
        case .emptyEmail:
            return "Please enter your E-mail"
            
        case .emptyPhoneNumber:
            return "Please enter phone Number"
            
        case .emptyPassword:
            return "Please enter password"
            
        case .invalidEmail:
            return "Please enter a valid E-mail"
            
        case .invalidPhoneNumber:
            return "Please enter a valid phone number"
            
        case .strongPasswprd:
            return "Short password"
            
        case .verficationCode:
            return "Please enter verfication code"
            
        case .emptyConfirmPassword:
            return "Please enter confirm password"
            
        case .matchPassword:
            return "Password doesn't matches"

        }
    }
}
