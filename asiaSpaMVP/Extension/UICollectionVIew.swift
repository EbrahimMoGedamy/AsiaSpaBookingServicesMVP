//
//  UICollectionVIew.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    func shadowDecorate(color : CGColor) {
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = color
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
    
}

extension UICollectionView {
    
    func registerCell<Cell : UICollectionViewCell>(cell : Cell.Type){
        
        let nibName = String(describing: cell.self) // transform classCellName to String
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func dequeCell<Cell : UICollectionViewCell>(cell : Cell.Type ,indexPath : IndexPath) -> Cell {
        
        let cellID = String(describing: Cell.self)
        let cell = self.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? Cell ?? UICollectionView()
        return cell as! Cell
    }
    
}
