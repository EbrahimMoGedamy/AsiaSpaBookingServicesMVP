//
//  CenterServicesVC+CollectionView.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension CenterServicesVC : UICollectionViewDataSource{
    
    func setupCollectionView(){
        self.servicesCollView.delegate = self
        self.servicesCollView.dataSource = self
        self.servicesCollView.registerCell(cell: CenterServicesCollViewCell.self)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.center?.servicesDataArr.count ?? 0)
        return self.center?.servicesDataArr.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CenterServicesCollViewCell", for: indexPath) as? CenterServicesCollViewCell{
            cell.nameServiceLb.text = self.center?.servicesDataArr[indexPath.row].name
            print(self.center?.servicesDataArr[indexPath.row].name ?? "")
            cell.backgroundColor = UIColor(displayP3Red: 43/255, green: 77/255, blue: 70/255, alpha: 0.66)
            cell.shadowDecorate(color: #colorLiteral(red: 0, green: 0.3598380089, blue: 0.3089635074, alpha: 1))
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: bounds.width/2.8, height: 120)
    }
    
}

extension CenterServicesVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 40, bottom: 10, right: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //Horizental Spacing
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //Vertical Spacing
        return 0
    }
}

extension CenterServicesVC : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let vc = MassageVC(nibName: "MassageVC", bundle: nil)
        vc.id = self.center?.servicesID[indexPath.row] ?? 0
        vc.type = self.type
        vc.swaped = self.cuponString
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
