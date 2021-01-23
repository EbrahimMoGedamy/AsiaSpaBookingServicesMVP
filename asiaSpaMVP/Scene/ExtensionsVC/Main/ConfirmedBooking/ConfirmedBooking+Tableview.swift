//
//  ConfirmedBooking+Tableview.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 21/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension ConfirmedBookingVC : UITableViewDataSource{
    
    func setUpTableView(tableView : UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .lightGray
        tableView.registerCell(cell: ConfirmBookingTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let count = {
//            return count
//        }else{
//            return 0
//        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? ConfirmBookingTableViewCell{
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ConfirmedBookingVC : UITableViewDelegate{}
