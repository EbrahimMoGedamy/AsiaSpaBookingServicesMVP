//
//  BillVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 15/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol BillProtocol : class {
    func moveToMain()
    func reloadTableViewData()
    func moveToBookingConfirm()
    func fireErrorAction(msg: String)
    func setPriceLbl(text: String)
    func setTotalPriceLbl(text: String)
    func setDiscountLbl(text: String)
}

class BillVC: UIViewController  {
    
    @IBOutlet weak var bookingConfirmBu: LocalizableButton!
    @IBOutlet weak var billTableView: UITableView!
    @IBOutlet weak var oriceLbl: LocalizableLabel!
    @IBOutlet weak var discountLbl: LocalizableLabel!
    @IBOutlet weak var totalPriceLbl: LocalizableLabel!
    @IBOutlet weak var priceNameLbl: LocalizableLabel!
    @IBOutlet weak var discountNameLbl: LocalizableLabel!
    @IBOutlet weak var totalPriceNameLbl: LocalizableLabel!
    @IBOutlet weak var discountCodeTxtxField: UITextField!
    @IBOutlet weak var mainLbl: LocalizableLabel!
    @IBOutlet weak var mainBu: UIButton!
    @IBOutlet weak var payCashBu: UIButton!
    @IBOutlet weak var creditCardBu: UIButton!
    @IBOutlet weak var onlinePayBu: UIButton!
    @IBOutlet weak var applePayBu: UIButton!
    @IBOutlet weak var walletPayBu: UIButton!
    @IBOutlet weak var agreeWithConditonsBu: UIButton!
    
    
    var billPre : BillPresenter?
    var flag = false
    var payType = ""
    var orderID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billPre = BillPresenter(service: self)
        mainBu.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        navigationController?.navigationBar.isHidden = true
        bookingConfirmBu.layer.cornerRadius = 10
        discountCodeTxtxField.layer.cornerRadius = 7
        setUpTableView(tableView: billTableView)
        billPre?.getData()
        let tap = UITapGestureRecognizer(target: self, action: #selector(billPre?.goToMain(sender:)))
        mainLbl.isUserInteractionEnabled = true
        mainLbl.addGestureRecognizer(tap)
        
    }
    
    @IBAction func payCashBuTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { _ in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: {[weak self] _ in
                guard let self = self else {return}
                if sender.isSelected {
                    self.payType = "cash"
                    print("pay type : \(self.payType)")
                    self.walletPayBu.isEnabled = false
                    self.creditCardBu.isEnabled = false
                } else {
                    self.payType = ""
                    print("pay type : \(self.payType)")
                    self.walletPayBu.isEnabled = true
                    self.creditCardBu.isEnabled = true
                }
                
            })
        }
        
    }
    @IBAction func creditCardBuTapped(_ sender: UIButton) {
    
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { _ in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: {[weak self] _ in
                guard let self = self else {return}
                if sender.isSelected {
                    self.payType = "atm"
                    print("pay type : \(self.payType)")
                    self.walletPayBu.isEnabled = false
                    self.payCashBu.isEnabled = false
                } else {
                    self.payType = ""
                    print("pay type : \(self.payType)")
                    self.walletPayBu.isEnabled = true
                    self.payCashBu.isEnabled = true
                }
            })
        }
        
    }
    @IBAction func onlinePayBuTapped(_ sender: UIButton) {
    }
    @IBAction func applePayBuTapped(_ sender: UIButton) {
        //                flag = !flag
        //        sender.checkUncheck(sender: sender, flag: flag, img1: "checkbox", img2: "uncheckbox")
        //        if sender.currentImage == UIImage(named: "checkbox"){
        //
        //            payCashBu.setImage(UIImage(named: "uncheckbox"), for: .normal)
        //            creditCardBu.setImage(UIImage(named: "uncheckbox"), for: .normal)
        //            onlinePayBu.setImage(UIImage(named: "uncheckbox"), for: .normal)
        //            walletPayBu.setImage(UIImage(named: "uncheckbox"), for: .normal)
        //        }
    }
    @IBAction func walletPayBuTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { _ in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: {[weak self] _ in
                guard let self = self else {return}
                if sender.isSelected {
                    self.payType = "wallet"
                    print("pay type : \(self.payType)")
                    self.payCashBu.isEnabled = false
                    self.creditCardBu.isEnabled = false
                } else {
                    self.payType = ""
                    print("pay type : \(self.payType)")
                    self.payCashBu.isEnabled = true
                    self.creditCardBu.isEnabled = true
                }
            })
        }
    }
    @IBAction func agreeWithConditonsBuTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { _ in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        
    }
    
    @IBAction func bookingConfirmBuTapped(_ sender: UIButton) {
        
        if ((agreeWithConditonsBu.currentImage == UIImage(named: "checkbox")&&((payCashBu.currentImage == UIImage(named: "checkbox"))||(walletPayBu.currentImage == UIImage(named: "checkbox"))||(creditCardBu.currentImage == UIImage(named: "checkbox"))))){
            billPre?.billProtocol?.moveToBookingConfirm()
        }else{
            customFailureAlert(msg: "should select agree with conditons and privacy OR select one pay type")
        }
    }
    
    @IBAction func goToMainBuTapped(_ sender: UIButton) {
        billPre?.billProtocol?.moveToMain()
    }
    
}
