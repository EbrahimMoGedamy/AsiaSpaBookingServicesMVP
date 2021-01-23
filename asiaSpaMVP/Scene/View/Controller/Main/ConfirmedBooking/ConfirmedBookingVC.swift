//
//  ConfirmedBooking.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 20/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol ConfirmedBookingProtocol : class {
    
    func fireErrorAction(msg: String)
    func goToPrintVC()
    func goToMainVC()
    func goToAccountVC()
    func reloadTableViewData()
    func getPrice(price:String)
    func getDiscount(price:String)
    func getTotalPrice(price:String)
    
}

class ConfirmedBookingVC: UIViewController {
    
    @IBOutlet weak var qrCodeImg: UIImageView!
    @IBOutlet weak var mainBu: UIButton!
    @IBOutlet weak var accountBu: UIButton!
    @IBOutlet weak var mainLbl: LocalizableLabel!
    @IBOutlet weak var aacountLbl: UILabel!
    @IBOutlet weak var bookingnumLbl: LocalizableLabel!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var addBookingView: UIView!
    @IBOutlet weak var printView: UIView!
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var addCalendarBookingView: UIView!
    @IBOutlet weak var shareAppFriendsView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var totalPricePlusEtraPrice: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var servicesTableView: UITableView!
    
    var orderID = 0
    var confirmBookingPre : ConfirmedBookingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmBookingPre = ConfirmedBookingPresenter(pro: self)
        let tap = UITapGestureRecognizer(target: self, action: #selector(gotoAccountVC(sender:)))
        mainLbl.isUserInteractionEnabled = true
        mainLbl.addGestureRecognizer(tap)
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(moveToPrintView))
        printView.isUserInteractionEnabled = true
        printView.addGestureRecognizer(gesture1)
        confirmBookingPre?.getData(orderID: 957)
    }
    
    @objc func moveToPrintView( ){
//        let printOrSavePDFVC = self.storyboard?.instantiateViewController(withIdentifier: "PrintOrSavePDFVC") as! PrintOrSavePDFVC
//        self.navigationController?.pushViewController(printOrSavePDFVC, animated: true)
        print("Tapped")
    }
    
    @objc func gotoAccountVC(sender : UITapGestureRecognizer) {
        //self.handlePushSegue(viewController: MyAccountVC.self)
        
    }
}
