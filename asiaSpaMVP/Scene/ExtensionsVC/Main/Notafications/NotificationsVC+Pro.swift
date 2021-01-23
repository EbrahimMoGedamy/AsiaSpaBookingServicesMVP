//
//  NotificationsVC+Pro.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension NotificationsVC : NotificationsProtocol{
    func reloadData() {
        self.notificationsTableView.reloadData()
    }
    
    func pushViewController() {
        //self.handlePushSegue(viewController: <#T##ViewController.Type#>)
    }
}
