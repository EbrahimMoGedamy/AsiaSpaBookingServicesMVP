//
//  Login+TableView.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/18/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension LoginVC : UITableViewDataSource {
    
    func setUpTableView() {
        self.countryCodeTableView.delegate = self
        self.countryCodeTableView.dataSource = self
        self.countryCodeTableView.registerCell(cell: IsoIDTableViewCell.self)
        self.countryCodeTableView.tableFooterView = UIView()
        self.countryCodeTableView.layer.cornerRadius = 5.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.loginPresenter?.isoIDArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IsoIDTableViewCell", for: indexPath) as? IsoIDTableViewCell{
            cell.countryCodeLbl.text = self.loginPresenter?.isoNameArr[indexPath.row]
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
}

extension LoginVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryCodeBuTitle = String(self.loginPresenter?.isoNameArr[indexPath.row] ?? "")
        countryCodeBu.setTitle(countryCodeBuTitle, for: .normal)
        self.countryCodeTableView.isHidden = true
    }
}
