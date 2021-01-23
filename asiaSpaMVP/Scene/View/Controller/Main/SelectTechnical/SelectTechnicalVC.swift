//
//  SelectTechnicalVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/22/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol SelectTechnicalProtocol : class {
    func reloadTechnicalCollectionView()
    func reloadDayCollectionView()
    func reloadTimeCollectionView()
    func fireSuccessPopup(msg : String)
    func fireFailPopup(msg : String)
    func pushToAnotherService()
    func pushToPay()
    
}
class SelectTechnicalVC: UIViewController {
    
    @IBOutlet weak var backBu: LocalizableButton!{
        didSet{
            backBu.set(image: UIImage(named: "arrow_pointt"), title: "Back", titlePosition: .bottom, additionalSpacing: -5.0, state: .normal, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
    }
    @IBOutlet weak var billBu: LocalizableButton!{
        didSet{
            billBu.set(image: UIImage(named: "bill"), title: "Bill", titlePosition: .bottom, additionalSpacing: -5.0, state: .normal, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
    }
    
    @IBOutlet weak var orintalMassageLbl: LocalizableLabel!{
        didSet{
            orintalMassageLbl.layer.cornerRadius = 6.5
            orintalMassageLbl.layer.borderColor = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
            orintalMassageLbl.layer.borderWidth = 1.0
        }
    }
    @IBOutlet weak var bookServiceBu: LocalizableButton!{
        didSet{
            bookServiceBu.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            bookServiceBu.layer.cornerRadius = 10.0
        }
    }
    @IBOutlet weak var selectTechnicalCollView: UICollectionView!
    @IBOutlet weak var selectDay: UICollectionView!
    @IBOutlet weak var selectTime: UICollectionView!
    @IBOutlet weak var selectTechnicalLbl: LocalizableLabel!
    @IBOutlet weak var roundView : UIView!
    @IBOutlet weak var roundView1 : UIView!
    @IBOutlet weak var roundView2 : UIView!
    @IBOutlet weak var roundView3 : UIView!
    @IBOutlet weak var hView : UIView!
    @IBOutlet weak var hView1 : UIView!
    @IBOutlet weak var hView2 : UIView!
    @IBOutlet weak var hView3 : UIView!
    
    var singleSubId = 0
    var selectTechnicalPre : SelectTechnicalPresenter?
    var employeID = 0
    var dayID = 0
    var dateID = 0
    var timeID = 0
    var type = ""
    var dayKey = ""
    var date2 = ""
    var orderID = 0
    var ordersubsericeID = 0
    var msg = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(singleSubId)
        self.selectTechnicalPre = SelectTechnicalPresenter(technical: self)
        print("Id : \(self.singleSubId)")
        self.setupSelectTechnical()
        self.setupSelectDay()
        self.setupSelectTime()
        self.viewDesgin()
        self.selectTechnicalPre?.servicesApi(subserviceID: self.singleSubId)
        orderID = selectTechnicalPre?.orderId ?? 0
    }
    
    @IBAction func backBuTapped(_ sender: LocalizableButton) {
        self.handlePushSegue(viewController: MainVC.self)
    }
    
    @IBAction func billBuTapped(_ sender: LocalizableButton) {
        handlePushSegue(viewController: BillVC.self)
    }
    
    @IBAction func btnRightArrowAction(_ sender: UIButton) {
        let collectionBounds = self.selectTechnicalCollView.bounds
        let contentOffset = CGFloat(floor(self.selectTechnicalCollView.contentOffset.x - collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
    
    @IBAction func bookServiceBuTapped(_ sender: LocalizableButton) {

        self.selectTechnicalPre?.makeOrderApi(subserviceID: self.singleSubId, empId: self.employeID, dayId: self.dayID, timeId: self.timeID, type: self.type, dayKey: self.dayKey, date2: self.date2)
    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.selectTechnicalCollView.contentOffset.y ,width : self.selectTechnicalCollView.frame.width,height : self.selectTechnicalCollView.frame.height)
        self.selectTechnicalCollView.scrollRectToVisible(frame, animated: true)
    }
    
    func viewDidTapped() {
        self.hView.backgroundColor  = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.hView.isHidden = false
        self.hView1.backgroundColor = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.hView3.backgroundColor = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.hView2.backgroundColor = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.roundView.backgroundColor  = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.roundView1.backgroundColor  = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.roundView2.backgroundColor  = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.roundView3.backgroundColor  = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
        self.bookServiceBu.backgroundColor = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
    }
    
    func viewDesgin() {
        self.roundView.layer.cornerRadius = 8.0
        self.roundView1.layer.cornerRadius = 8.0
        self.roundView2.layer.cornerRadius = 8.0
        self.roundView3.layer.cornerRadius = 8.0
        self.hView.isHidden = true
    }
}


