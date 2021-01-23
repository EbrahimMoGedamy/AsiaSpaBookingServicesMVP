//
//  MassageVC+CollView.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension MassageVC : UICollectionViewDataSource{
    
    func setupCollectionView(){
        self.servicesCollView.delegate = self
        self.servicesCollView.dataSource = self
        self.servicesCollView.registerCell(cell: CenterServicesCollViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.massagePre?.servicsData.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CenterServicesCollViewCell", for: indexPath) as? CenterServicesCollViewCell {
            cell.nameServiceLb.text = self.massagePre?.servicsData[indexPath.row].name
//            cell.shadowDecorate(color: #colorLiteral(red: 0, green: 0.3519185483, blue: 0.3439853787, alpha: 1))
            if self.massagePre?.servicsData[indexPath.row].selected == 1{
               cell.backgroundColor = #colorLiteral(red: 0, green: 0.3915696613, blue: 0.3439853787, alpha: 1)
            }else{
                cell.backgroundColor = #colorLiteral(red: 0.3176470588, green: 0.5294117647, blue: 0.4901960784, alpha: 1)
            }
            cell.shadowDecorate(color: #colorLiteral(red: 0, green: 0.3519185483, blue: 0.3439853787, alpha: 1))
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
}

extension MassageVC : UICollectionViewDelegate{}
