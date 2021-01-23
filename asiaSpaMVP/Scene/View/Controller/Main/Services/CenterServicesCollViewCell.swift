//
//  CenterServicesCollViewCell.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class CenterServicesCollViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameServiceLb: LocalizableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameServiceLb.layer.cornerRadius = 5.0
        nameServiceLb.backgroundColor = UIColor.clear
    }
    
}
