//
//  EmployeeDetails+TableView.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 20/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

extension EmployeeDetailsVC : UITableViewDataSource{
    func setUpTableView(tableView : UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .none
        tableView.registerCell(cell: EmployeeTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = emoloyeeDetailsPre?.reviewsArr.count{
            print(count)
            return count
        }else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell") as? EmployeeTableViewCell {
            
            cell.commentContent.text = emoloyeeDetailsPre?.reviewsArr[indexPath.row].comment
            cell.name.text = emoloyeeDetailsPre?.reviewsArr[indexPath.row].user.name
            cell.time.text = emoloyeeDetailsPre?.reviewsArr[indexPath.row].createdAt
            let userImgURL = URL(string: emoloyeeDetailsPre?.reviewsArr[indexPath.row].user.avatar ?? "")
            AF.request(userImgURL!, method: .get).responseImage { (resp) in
                if case .success(let image) = resp.result {
                    DispatchQueue.main.async {
                        cell.profileImg.image = image
                    }
                }
            }
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension EmployeeDetailsVC : UITableViewDelegate{}
