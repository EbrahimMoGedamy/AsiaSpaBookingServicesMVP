//
//  CenterServicesTableViewCell.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol ServiceInnerCellDelegate {
    func pay()
}

class CenterServicesTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceNameLbl: LocalizableLabel!
    @IBOutlet weak var technicalLbl: LocalizableLabel!
    @IBOutlet weak var payBu: LocalizableButton!
    @IBOutlet weak var timeLbl: LocalizableLabel!
    @IBOutlet weak var dateLbl: LocalizableLabel!
    
    var delegateServiceInnerCell : ServiceInnerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.payBu.layer.cornerRadius = 5.0
    }

    @IBAction func payBuTapped(_ sender: LocalizableButton) {
        self.delegateServiceInnerCell?.pay()
    }
    
}
