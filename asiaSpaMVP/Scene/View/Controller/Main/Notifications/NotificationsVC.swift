//
//  NotificationsVC.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol NotificationsProtocol : class {
    
    func reloadData()
    func pushViewController()
}

class NotificationsVC: UIViewController {

    @IBOutlet weak var notaficationsLbl: LocalizableLabel!
    @IBOutlet weak var notificationsTableView: UITableView!
    
    var notaficationsPre : NotaficationsPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.notaficationsPre = NotaficationsPresenter(notification: self)
        self.setUpTableView()

    }

}
