//
//  CenterServicesVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol CenterServicesProtocol : class {
    
    func reloadTableViewData()
    func reloadCollectionViewData()
    func fireErrorAction(errorMsg : String )
    func gotoBillVC()
    func gotoMainVC()
}

class CenterServicesVC: UIViewController {
    
    var type = ""
    
    @IBOutlet weak var moreBu: LocalizableButton!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var billImg: UIImageView!
    @IBOutlet weak var aboutusImg: UIImageView!
    @IBOutlet weak var siteImg: UIImageView!
    @IBOutlet weak var bookingsImg: UIImageView!
    @IBOutlet weak var moneyImg: UIImageView!
    @IBOutlet weak var mainLbl: LocalizableLabel!
    @IBOutlet weak var billLbl: LocalizableLabel!
    @IBOutlet weak var aboutusLbl: LocalizableLabel!
    @IBOutlet weak var siteLbl: LocalizableLabel!
    @IBOutlet weak var bookingsLbl: LocalizableLabel!
    @IBOutlet weak var moneyLbl: LocalizableLabel!
    @IBOutlet weak var servicesCollView: UICollectionView!{
        didSet{
            print(type)
            if self.type == "center"{
                servicesCollView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgroundhome"))
            }else{
                servicesCollView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg"))
            }
        }
    }
    @IBOutlet weak var unPaidServicesTableView: UITableView!
    @IBOutlet weak var unPaidLbl: LocalizableLabel!
    
    var center : CenterServicesPresenter?
    var cuponString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.center = CenterServicesPresenter(service: self)
        self.center?.getData(type: self.type)
        self.setupCollectionView()
        self.setUpTableView()
        handleGestures()
        
    }
    
    func handleGestures(){
        
        let mainTap = UITapGestureRecognizer(target: self, action: #selector(gotoMain))
        mainImg.isUserInteractionEnabled = true
        mainImg.addGestureRecognizer(mainTap)
        
        let mainLblTap = UITapGestureRecognizer(target: self, action: #selector(gotoMain))
        mainLbl.isUserInteractionEnabled = true
        mainLbl.addGestureRecognizer(mainLblTap)
        
        let billTap = UITapGestureRecognizer(target: self, action: #selector(gotoBill))
        billImg.isUserInteractionEnabled = true
        billImg.addGestureRecognizer(billTap)
        
        let billLblTap = UITapGestureRecognizer(target: self, action: #selector(gotoBill))
        billLbl.isUserInteractionEnabled = true
        billLbl.addGestureRecognizer(billLblTap)
        
    }
    
    @objc func gotoBill(){
        self.handlePushSegue(viewController: BillVC.self)
    }
    
    @objc func gotoMain(){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func moreBuTapped(_ sender: LocalizableButton) {
        
    }
}
