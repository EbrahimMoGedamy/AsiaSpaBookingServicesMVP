//
//  MainVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/13/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import CDAlertView

protocol MainProtocol : class{
    
}

class MainVC: UIViewController {
    
    @IBOutlet weak var servicesInCenterBu: LocalizableButton!{
        didSet{
            servicesInCenterBu.layer.cornerRadius = 10.0
        }
    }
    @IBOutlet weak var loginLbl: LocalizableLabel!
    @IBOutlet weak var loginImg: UIImageView!
    @IBOutlet weak var langLbl: LocalizableLabel!
    
    @IBOutlet weak var homeServicesBu: LocalizableButton!{
        didSet{
            homeServicesBu.layer.cornerRadius = 10.0
        }
    }
    @IBOutlet weak var souvenirouponBu: LocalizableButton!{
        didSet{
            souvenirouponBu.layer.cornerRadius = 10.0
        }
    }
    @IBOutlet weak var ourSiteBu: LocalizableLabel!
    @IBOutlet weak var myPointsBu: LocalizableLabel!
    @IBOutlet weak var myBookingsBu: LocalizableLabel!
    @IBOutlet weak var aboutUsBu: LocalizableLabel!
    @IBOutlet weak var mainView: UIView!{
        didSet{
            mainView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgroundhome"))
        }
    }
    
    
    var mainPre : MainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainPre = MainPresenter(pro: self)
        self.navigationController?.isNavigationBarHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(gotoLoginVC(tap:)))
        loginLbl.isUserInteractionEnabled = true
        loginImg.isUserInteractionEnabled = true
        loginLbl.addGestureRecognizer(tap)
        loginImg.addGestureRecognizer(tap)
        
    }
    
    
    @objc func gotoLoginVC(tap : UIGestureRecognizer){
        handlePushSegue(viewController: LoginVC.self)
    }
    // Mark: - func of check current language
    func checkLanguageTitle() {
        
        if Language.currentLanguage() == "ar" {
            self.langLbl.text = "ع"
        }
        else {
            self.langLbl.text = "E"
        }
    }
    
    @IBAction func loginBuTapped(_ sender: LocalizableButton) {
        self.handlePushSegue(viewController: LoginVC.self)
    }
    
    @IBAction func centerServicesBuTapped(_ sender: LocalizableButton) {
        
        let vc = CenterServicesVC(nibName: "CenterServicesVC", bundle: nil)
        vc.type = "center"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func souvenirCuponBuTapped(_ sender: LocalizableButton) {
        
        //        let vc = CenterServicesVC(nibName: "CenterServicesVC", bundle: nil)
        //        vc.type = "center"
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func homeServicesBuTapped(_ sender: LocalizableButton) {
        let vc = CenterServicesVC(nibName: "CenterServicesVC", bundle: nil)
        vc.type = "visit"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func myBookingsBuTapped(_ sender: LocalizableButton) {
        Helper.restartApp {
            //            let vc = CenterServicesVC(nibName: "CenterServicesVC", bundle: nil)
            //            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func notificationsBuTapped(_ sender: LocalizableButton) {
        self.popover(sender, style: .popover, width: 300, height: 300, vc: NotificationsVC.self, completion: nil)
    }
    
    @IBAction func changLangBuTapped(_ sender: LocalizableButton) {
        guard let window = UIApplication.shared.keyWindow else {return}
        let actionSheet = UIAlertController()
        // change to arabic
        actionSheet.addAction(UIAlertAction(title: "عربي", style: .default, handler: { [weak self] (action:UIAlertAction) in
            guard let self = self else {return}
            self.fireSuccessAction(successMsg: "To continue to arabic language , close and reopen App") { (_) in
                
                //self.mainPre?.getData(lang: "ar")
                Language.setAppLanguage(lang: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                let vc = MainVC(nibName: "MainVC", bundle: nil)
                window.rootViewController = vc
            }
        }))
        // change to english
        actionSheet.addAction(UIAlertAction(title: "English", style: .default, handler: { [weak self](action:UIAlertAction) in
            guard let self = self else {return}
            self.fireSuccessAction(successMsg: "أغلق التطبيق ثم افتحه بعد تغيير اللغة الي الانجليزية") { (_) in
                Language.setAppLanguage(lang: "en")
                //self.mainPre?.getData(lang: "en")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                let vc = MainVC(nibName: "MainVC", bundle: nil)
                window.rootViewController = vc
            }
        }))
        if Language.currentLanguage() == "en" {
            actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
            
            self.present(actionSheet, animated: true)
        }
        else {
            actionSheet.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    
}
