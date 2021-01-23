//
//  ServicesTableViewCell.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/21/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol ServicesTVCellProtocol {
    func didSelect()
}

class ServicesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: LocalizableLabel!{
        didSet{
            titleLbl.layer.cornerRadius = 20.0
        }
    }
    @IBOutlet weak var priceView: UIView!{
        didSet{
            priceView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            priceView.layer.borderWidth = 0.5
            priceView.layer.cornerRadius = 3.0
        }
    }
    @IBOutlet weak var roundView: UIView!{
        didSet{
            roundView.layer.cornerRadius = 510.0
        }
    }
    @IBOutlet weak var addedValueLbl: LocalizableLabel!
    @IBOutlet weak var serviceImage: UIImageView!{
        didSet{
            serviceImage.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descriptionTxt: LocalizableLabel!
    @IBOutlet weak var selectBu: LocalizableButton!{
        didSet{
            selectBu.layer.cornerRadius = 5.0
        }
    }
    
    var delegate : ServicesTVCellProtocol?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    
    @IBAction func selectBuTpped(_ sender: LocalizableButton) {
        self.delegate?.didSelect()
    }
    
}
