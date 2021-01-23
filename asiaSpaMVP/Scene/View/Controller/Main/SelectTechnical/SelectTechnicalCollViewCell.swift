//
//  SelectTechnicalCollViewCell.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/22/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol DetailProtocol : class{
    func detailBu(_ sender : UIButton)
}

class SelectTechnicalCollViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberOfRateLbl: LocalizableLabel!
    @IBOutlet weak var numberOfAllRateLbl: LocalizableLabel!
    @IBOutlet weak var allRateLbl: LocalizableLabel!
    @IBOutlet weak var rateLbl: LocalizableLabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var detailsBu: LocalizableButton!
    @IBOutlet weak var companyNameLbl: LocalizableLabel!
    
    weak var delegate : DetailProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = #colorLiteral(red: 0.1625107021, green: 0.4219971944, blue: 0.3523049766, alpha: 1)
        self.contentView.layer.cornerRadius = 10.0
        self.profileImage.layer.cornerRadius = 10.0
        
    }

    @IBAction func detailBuTapped(_ sender: UIButton) {
        self.delegate?.detailBu(sender)
    }
}
