//
//  MassageVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol MassageProtocol : class {
    
    func servicesTableViewData()
    func unPaidServicesTableViewData()
    func reloadCollectionViewData()
    func fireErrorAction(errorMsg: String) 
}

class MassageVC: UIViewController {
    
    @IBOutlet weak var mainLbl: LocalizableLabel!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(gotoMain))
            mainLbl.isUserInteractionEnabled = true
            mainLbl.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var mainImg: UIImageView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(gotoMain))
            mainImg.isUserInteractionEnabled = true
            mainImg.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var billLbl: LocalizableLabel!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(gotoBill))
            billLbl.isUserInteractionEnabled = true
            billLbl.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var billImg: UIImageView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(gotoBill))
            billImg.isUserInteractionEnabled = true
            billImg.addGestureRecognizer(tap)
        }
    }
    
    @IBOutlet weak var moreBu: LocalizableButton!
    @IBOutlet weak var servicesCollView: UICollectionView!
    @IBOutlet weak var servicesTableView: UITableView!
    @IBOutlet weak var unPaidServicesTableView: UITableView!
    @IBOutlet weak var unPaidLbl: LocalizableLabel!
    
    var id = 0
    var type = ""
    var imageUrl : String = ""
    var swaped = ""
    var selectedIndex = -1
    var isCollapse = false
    var massagePre : MassagePresenter?
    var singleSubservice : SingleSubservice?
    var subServiceId = 0
    
    var tableViewHeaderText = ""
    
    /// an enum of type TableAnimation - determines the animation to be applied to the tableViewCells
    var currentTableAnimation: TableAnimation = .fadeIn(duration: 0.85, delay: 0.03) {
        didSet {
            self.tableViewHeaderText = currentTableAnimation.getTitle()
        }
    }
    var animationDuration: TimeInterval = 0.85
    var delay: TimeInterval = 0.05
    var fontSize: CGFloat = 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        massagePre = MassagePresenter(massage: self)
        setupCollectionView()
        massagePre?.getData(id: id, type: type)
        servicesTableView.isHidden = true 
        setUpTableView(tableView: servicesTableView)
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            guard let self = self else {return}
            self.servicesTableView.isHidden = false
            self.currentTableAnimation = TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            
        }
        //setUpTableView(tableView: unPaidServicesTableView)
    }
    
    @objc func gotoBill(){
        handlePushSegue(viewController: BillVC.self)
    }
    
    @objc func gotoMain(){
        handlePushSegue(viewController: MainVC.self)
    }
    
}
