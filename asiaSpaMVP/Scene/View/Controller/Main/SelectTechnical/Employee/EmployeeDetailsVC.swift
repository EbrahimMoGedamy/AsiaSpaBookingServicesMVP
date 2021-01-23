//
//  EmployeeDetailsVC.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 20/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol EmployeeDetailsProtocol : class{
    func getTechName(techName : String)
    func moveToMyAccount()
    func getRate(ratee : Double)
    func getRateCount(rateeCount : Int)
    func reloadEmployeTableView()
    func fireErrorAction(msg:String)
    func getImage(img:UIImage)
}

class EmployeeDetailsVC: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var technicalName: LocalizableLabel!
    @IBOutlet weak var rateCount: LocalizableLabel!
    @IBOutlet weak var rate: LocalizableLabel!
    @IBOutlet weak var backBu: LocalizableButton!
    @IBOutlet weak var accountBu: LocalizableButton!
    @IBOutlet weak var backLbl: LocalizableLabel!
    @IBOutlet weak var accountLbl: LocalizableLabel!
    
    var employeeID = 0
    var emoloyeeDetailsPre : EmployeeDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(employeeID)
        emoloyeeDetailsPre = EmployeeDetailsPresenter(emp: self)
        emoloyeeDetailsPre?.getData(id: employeeID)
        setUpTableView(tableView: employeeTableView)
        backBu.addTarget(self, action: #selector(goback), for: .touchUpInside)
        accountBu.addTarget(self, action: #selector(emoloyeeDetailsPre?.goToMyAccount(sender:)), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(goback))
        backLbl.isUserInteractionEnabled = true
        backLbl.addGestureRecognizer(tap)
        let tapp = UITapGestureRecognizer(target: self, action: #selector(emoloyeeDetailsPre?.goToMyAccount(sender:)))
        accountLbl.isUserInteractionEnabled = true
        accountLbl.addGestureRecognizer(tapp)
    }

}
