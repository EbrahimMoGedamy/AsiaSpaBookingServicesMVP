//
//  SelectTechnical+CollectionView.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/22/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire

extension SelectTechnicalVC :UICollectionViewDataSource{
    
    func setupSelectTechnical(){
        selectTechnicalCollView.delegate = self
        selectTechnicalCollView.dataSource = self
        selectTechnicalCollView.register(UINib(nibName: "SelectTechnicalCollViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectTechnicalCollViewCell")
    }
    
    func setupSelectDay(){
        selectDay.delegate = self
        selectDay.dataSource = self
        selectDay.register(UINib(nibName: "SelectDayCollViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectDayCollViewCell")
    }
    
    func setupSelectTime(){
        selectTime.delegate = self
        selectTime.dataSource = self
        selectTime.register(UINib(nibName: "SelectTimeCollViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectTimeCollViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == selectTechnicalCollView{
            return self.selectTechnicalPre?.employee.count ?? 0
        }else if collectionView == selectDay {
            return self.selectTechnicalPre?.day.count ?? 0
        }else{
            return self.selectTechnicalPre?.time.count ?? 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == selectTechnicalCollView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectTechnicalCollViewCell", for: indexPath) as? SelectTechnicalCollViewCell{
                cell.delegate = self
                cell.numberOfRateLbl.text = "\(self.selectTechnicalPre?.employee[indexPath.row].rate ?? 0.0)"
                cell.companyNameLbl.text = self.selectTechnicalPre?.employee[indexPath.row].name
                cell.numberOfAllRateLbl.text = "\(self.selectTechnicalPre?.employee[indexPath.row].ratesCount ?? 0)"
                AF.request("\(self.selectTechnicalPre?.employee[indexPath.row].image ?? "")").responseImage { response in
                    if case .success(let image) = response.result {
                        cell.profileImage.image = image
                    }
                }
                
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else if collectionView == selectDay {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectDayCollViewCell", for: indexPath) as? SelectDayCollViewCell{
                cell.backgroundColor = #colorLiteral(red: 0.2668390537, green: 0.5294117647, blue: 0.4901960784, alpha: 1)
                cell.layer.cornerRadius = 10.0
                cell.dateLbl.text = self.selectTechnicalPre?.day[indexPath.row].date1
                cell.dayLbl.text = self.selectTechnicalPre?.day[indexPath.row].name
                if self.selectTechnicalPre?.day[indexPath.row].available == 0{
                    cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                }
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectTimeCollViewCell", for: indexPath) as? SelectTimeCollViewCell{
                
                cell.backgroundColor = #colorLiteral(red: 0.2668390537, green: 0.5294117647, blue: 0.4901960784, alpha: 1)
                cell.layer.cornerRadius = 10.0
                cell.discountValueLbl.text = "\(self.selectTechnicalPre?.time[indexPath.row].discount ?? 0)"
                cell.timeLbl.text = self.selectTechnicalPre?.time[indexPath.row].time ?? ""
                if self.selectTechnicalPre?.time[indexPath.row].available == 0{
                    cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                }
                return cell
            }else{
                return UICollectionViewCell()
            }
        }
    }
}

extension SelectTechnicalVC : DetailProtocol{
    func detailBu(_ sender: UIButton) {
        let vc = EmployeeDetailsVC(nibName: "EmployeeDetailsVC", bundle: nil)
        vc.employeeID = selectTechnicalPre?.employee[sender.tag].id ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension SelectTechnicalVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.selectTechnicalCollView {
            self.employeID = self.selectTechnicalPre?.employee[indexPath.row].id ?? 0
            self.selectTechnicalPre?.showDayApi(subserviceID: self.singleSubId, empId: self.employeID)
            self.viewDidTapped()
            
        }else if collectionView == self.selectDay {
            self.dayID = self.selectTechnicalPre?.day[indexPath.row].id ?? 0
            self.selectTechnicalPre?.showTimeApi(subserviceID: self.singleSubId, empId: self.employeID, dayId: dayID)
            self.dayKey = self.selectTechnicalPre?.day[indexPath.row].dayKey ?? ""
            self.date2 = self.selectTechnicalPre?.day[indexPath.row].date2 ?? ""
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectDayCollViewCell", for: indexPath) as? SelectDayCollViewCell{
                cell.backgroundColor = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectTimeCollViewCell", for: indexPath) as? SelectTimeCollViewCell{
                cell.backgroundColor = #colorLiteral(red: 0, green: 0.3356035352, blue: 0.2980042696, alpha: 1)
            }
            self.timeID = self.selectTechnicalPre?.time[indexPath.row].id ?? 0
        }
    }
}

