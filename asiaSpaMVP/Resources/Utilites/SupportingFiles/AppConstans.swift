
//
//  AppConstans.swift
//  MomCare
//
//  Created by Eissa on 4/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation
import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let def = UserDefaults.standard

let blue = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
let blueColor = UIColor(rgb: 0x5384cf)
let greenColor = UIColor(rgb: 0x64c58b)
let cellBG = UIColor(rgb: 0x2B4883)

//let pinkColor = UIColor(rgb: 0xFB086A)
//let boldGrayFont = UIColor(rgb: 0x474438)
//let lightGrayFont = UIColor(rgb: 0x9EA19E)

//let orangeColor = UIColor(rgb: 0xFFAA15)
let redcolor = UIColor(rgb: 0xFA3737)
//let primaryColor = UIColor(rgb: 0x005490)
//let statusBarColor = UIColor(rgb: 0x003F6C)
//let fontColor = UIColor(rgb: 0x868686)
//let searchInputColor = UIColor(rgb: 0x003F6C)
//let placeHolderColor = UIColor(rgb: 0x4C7897)
//let introTextColor = UIColor(rgb: 0x707070)
//let headerColor = UIColor(rgb: 0x003F6C)
//let boldFontColor = UIColor(rgb: 0x4E4E4E)
//let inputPlaceholderColor = UIColor(rgb: 0xA7BAC7)
//let smallFontColor = UIColor(rgb: 0x949494)
//
//let InfoColor = UIColor(rgb: 0xF0F0F0)
//let GrayView = UIColor(rgb: 0xFAFAFA)
//let GrayBorder = UIColor(rgb: 0xD5D5D5)


extension Notification.Name {
    static let didAddComment = Notification.Name("didAddComment")
    static let didFavOrUnfav = Notification.Name("didFavOrUnfav")
    static let didDeleteNotification = Notification.Name("didDeleteNotification")
    static let didDeleteAd = Notification.Name("didDeleteAd")
    static let didEditAd = Notification.Name("didEditAd")
    static let didBlockedUser = Notification.Name("didBlockedUser")
    
}



