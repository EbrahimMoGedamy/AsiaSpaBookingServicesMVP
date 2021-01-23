//
//  CenterServicesVC+TableView.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension CenterServicesVC : UITableViewDataSource {
    
    func setUpTableView() {
        self.unPaidServicesTableView.delegate = self
        self.unPaidServicesTableView.dataSource = self
        self.unPaidServicesTableView.registerCell(cell: CenterServicesTableViewCell.self)
        self.unPaidServicesTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("subserviceNameArr \(self.center?.subserviceNameArr.count ?? 0)")
        return self.center?.subserviceNameArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CenterServicesTableViewCell", for: indexPath) as? CenterServicesTableViewCell {
            
            cell.serviceNameLbl.text = self.center?.subserviceNameArr[indexPath.row]
            cell.dateLbl.text = self.center?.dateArr[indexPath.row]
            cell.timeLbl.text = self.center?.timeArr[indexPath.row]
            cell.technicalLbl.text = self.center?.employeeNameArr[indexPath.row]
            cell.delegateServiceInnerCell = self
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension CenterServicesVC : ServiceInnerCellDelegate{
    func pay() {
        self.handlePushSegue(viewController: BillVC.self)
    }
}

extension CenterServicesVC : UITableViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "MassageVC") as? MassageVC{
            vc.id = self.center?.servicesDataArr[indexPath.row].id ?? 0
            vc.type = self.type
            vc.swaped = self.cuponString
            self.navigationController?.pushViewController(vc, animated: true)
        }else{return}
    }
}
