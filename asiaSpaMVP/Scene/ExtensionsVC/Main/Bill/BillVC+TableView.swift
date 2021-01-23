//
//  BillVC+TableView.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 18/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension BillVC : UITableViewDataSource{
    func setUpTableView(tableView : UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .lightGray
        tableView.registerCell(cell: BillTableViewCell.self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let subserviceNameArrCount = billPre?.subserviceNameArr.count {
            print(subserviceNameArrCount)
            return subserviceNameArrCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BillTableViewCell") as? BillTableViewCell{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                cell.dateLbl.text = self.billPre?.dateArr[indexPath.row]
                cell.priceLbl.text = String(self.billPre?.priceArr[indexPath.row] ?? 0)
                cell.serviceNameLbl.text = self.billPre?.subserviceNameArr[indexPath.row]
                cell.timeLbl.text = self.billPre?.timeArr[indexPath.row]
            }
            cell.deletDelegate = self
            cell.editDelegate = self
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension BillVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension BillVC : BillTVEditDelegate{
    func editOrder() {
        print("edit")
    }
}

extension BillVC : BillTVDeletDelegate{
    func deletOrder() {
        print("delet")
    }
}

