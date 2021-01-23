////
////  Helper.swift
////  MomCare
////
////  Created by Eissa on 3/28/20.
////  Copyright © 2020 Eissa. All rights reserved.
////
//
import UIKit
//class helper: NSObject {
//
//   class func restartApp() {
//
//     guard let window = UIApplication.shared.keyWindow else {return}
//
//     let sb = UIStoryboard(name: "Main", bundle: nil)
//
//     var vc : UIViewController
//
//        if getData() == nil {
//            vc = sb.instantiateInitialViewController()!
//        }
//
//        else {
//
//             vc = sb.instantiateViewController(withIdentifier:"Tabbar")
//        }
//
//      window.rootViewController = vc
//      UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
//
//     }
//
//    class func saveData(key: String, name: String, id: Int, phone: String, avatar: String, rate: Int) {
//
//        let def = UserDefaults.standard
//        def.set(key, forKey: "key")
//        def.setValue(id, forKey: "id")
//        def.setValue(name, forKey: "name")
//        def.setValue(phone, forKey: "phone")
//        def.setValue(avatar, forKey: "avatar")
//        def.setValue(rate, forKey: "rate")
//        def.synchronize()
//
//        guard let window = UIApplication.shared.keyWindow else {return}
//
////        let vc = Storyboard.Main.instantiate(Tabbar.self)
////        vc.selectedIndex = 0
////        window.rootViewController = vc
//
//        restartApp()
//    }
//
//    class func getData() -> Any? {
//
//        let def = UserDefaults.standard
//      //  return def.object(forKey: "key") as? String
//        return def.object(forKey: "id") as? Int
//      //  return def.object(forKey: "name") as? String
//      //  return def.object(forKey: "phone") as? String
//      //  return def.object(forKey: "avatar") as? String
//     //   return def.object(forKey: "rate") as? Int
//
//    }
//
//}

/*["email": "sherifgedamy12@gmail.com", "name": "sherif", "password": "1234567", "lang": "en", "iso_id": 2, "phone": "1018874869", "device_id": "qwekjqwekanxckippawqyqwrytfhgfytafdasfdzcnjtaswq", "device_type": "ios"]
URL : https://asiaspa.aait-sa.com/api/register
response.data
{"key":"success","value":"1","msg":"Please confirm your phone number.","data":{"user_id":200,"v_code":"2067"}}
Register(key: "success", value: "1", msg: "Please confirm your phone number.", data: asiaSpaMVP.RegisterData(userID: 200, vCode: "2067"))*/
// MARK:- saveID
class Helper {
    
    class func restartApp(completion : (() -> Void)? = nil){
        var vc : UIViewController?
        guard let window = UIApplication.shared.keyWindow else {return}
        
        if getApiID() == nil {
            // goto Auth Screen
            vc = RegisterVC(nibName: "RegisterVC", bundle: nil)
        }
        else{
            // goto Main Screen
            vc = MainVC(nibName: "MainVC", bundle: nil)
        }
        window.rootViewController = vc
//        UIView.transition(with: window, duration: 0.5, options: ., animations: nil, completion: nil)
    }
  
    class func saveID(id : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "user_id")
        defaults.synchronize() // to save id in memory
        print("IDFROMSAVEID : \(id)")

    }
    
    // MARK:- removeID
    class func removeID(id : Int){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "user_id")
        print("IDremove : \(id)")
        self.restartApp()
    }
    
    class func getApiID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "user_id") as? Int

    }
    
    // MARK:- cuponID
    class func saveCuponID(id : Int){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "copoun_id")
        print("cuponID : \(id)")
    }
    
    class func getCuponID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "copoun_id") as? Int
    }
    
    // MARK:- QRCodeID
    class func saveQRCodeID(id : Int){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "id")
        print("QRCodeID : \(id)")
    }
    
    class func getQRCodeID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "id") as? Int
    }
    
    // MARK:- email
    class func saveEmail(email : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(email, forKey: "email")
        defaults.synchronize() // to save id in memory
        print("email : \(email)")
        
    }
    
    class func getEmail() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "email") as? String
        
    }
    
    // MARK:- username
    class func saveUsername(username : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(username, forKey: "name")
        defaults.synchronize() // to save id in memory
        print("name : \(username)")
    }
    
    class func getUsername() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "name") as? String
        
    }
    
    // MARK:- saveVCode
    class func saveVCode(vCode : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(vCode, forKey: "v_code")
        defaults.synchronize() // to save id in memory
        print("IDFROMSAVEVCode: \(vCode)")
        
    }
    
    class func getApiVCode() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "v_code") as? Int
    }
    
    // MARK:- saveEmployeeID
    class func saveEmployeeID(employeeID : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(employeeID, forKey: "employee_id")
        defaults.synchronize() // to save id in memory
    }
    
    class func getEmployeeID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "employee_id") as? Int
    }
    
    
    // MARK:- saveIsoID
    
    class func saveIsoID(isoID :Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(isoID, forKey: "iso_id")
        defaults.synchronize() // to save id in memory
        print("isoIDFromSaveIsoID : \(isoID)")
    }
    class func getApiIsoID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "iso_id") as? Int
    }
    
    // MARK:- saveIso
    class func saveIso(iso : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(iso, forKey: "iso")
        defaults.synchronize() // to save id in memory
        print("isoFromSaveIso : \(iso)")
        
    }
    class func getApiIso() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "iso") as? String
    }
    
    
    // MARK:- savePhone
    class func savePhone(phone : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(phone, forKey: "phone")
        defaults.synchronize() // to save id in memory
        print("phoneFromSavePhone : \(phone)")
    }
    
    class func getApiPhone() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "phone") as? String
    }
    
    // MARK:- savePassword
    class func savePassword(password : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(password, forKey: "password")
        defaults.synchronize() // to save id in memory
        print("passwordFromSavePassword : \(password)")
    }
    
    class func getApiPassword() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "password") as? String
    }
    
    // MARK:- savePoints
    class func savePoints(points : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(points, forKey: "data")
        defaults.synchronize() // to save id in memory
        
    }
    
    class func getApiPoints() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "data") as? Int
    }
    
    // MARK:- saveServicesID
    class func saveServicesID(servicesID : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(servicesID, forKey: "service_id")
        defaults.synchronize() // to save id in memory
        
    }
    
    class func getServicesID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "service_id") as? Int
    }
    
    
    // MARK:- saveSubServicesID
    class func saveSubServicesID(subServicesID : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(subServicesID, forKey: "subservice_id")
        defaults.synchronize() // to save id in memory
        
    }
    
    class func getSubServicesID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "subservice_id") as? Int
    }
    
    // MARK:- saveEmployeeID
    class func saveEmployeeName(id : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "employee_id")
        defaults.synchronize() // to save id in memory
        print("idFromSaveEmployeeName : \(id)")
    }
    
    class func getApiEmployeeName() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "employee_id") as? Int
    }
    
    // MARK:- saveDayID
    class func saveDayID(id : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "day_id")
        defaults.synchronize() // to save id in memory
        print("idFromSaveDayID : \(id)")
    }
    
    class func getApiSaveDayID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "day_id") as? Int
    }
    
    // MARK:- saveTimeID
    class func saveTimeID(id : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "time_id")
        defaults.synchronize() // to save id in memory
        print("idFromSaveTimeID : \(id)")
    }
    
    class func getApiSaveTimeID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "time_id") as? Int
    }
    
    // MARK:- saveDayKey
    class func saveDayKey(id : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "day_key")
        defaults.synchronize() // to save id in memory
        print("idFromSaveTimeID : \(id)")
    }
    
    class func getApiSaveDayKey() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "day_key") as? String
    }
    
    // MARK:- saveDate2
    class func saveDate2(id : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "date2")
        defaults.synchronize() // to save id in memory
        print("idFromSavedate2 : \(id)")
    }
    
    class func getApiDate2() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "date2") as? String
    }
    
    // MARK:- saveOrderID
    class func saveOrderID(id : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "order_id")
        defaults.synchronize() // to save id in memory
        print("idFromSaveOrderID : \(id)")
    }
    
    class func getApiOrderID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "order_id") as? Int
    }
    
    // MARK:- saveOrdersubsericeID
    class func saveOrdersubsericeID(id : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "ordersubserice_id")
        defaults.synchronize() // to save id in memory
        print("idFromSaveTimeID : \(id)")
    }
    
    class func getApiOrdersubsericeID() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "ordersubserice_id") as? Int
    }
    
    // MARK:- saveTimeID
    class func saveOrdersubservicesCount(id : Int){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "ordersubservices_count")
        defaults.synchronize() // to save id in memory
        print("idFromSaveTimeID : \(id)")
    }
    
    class func getApiOrdersubservicesCount() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "ordersubservices_count") as? Int
    }
    
    static var puplicIsoID : Int?
//    static let userID = getApiID()
    static let allPoints = getApiPoints()
}
