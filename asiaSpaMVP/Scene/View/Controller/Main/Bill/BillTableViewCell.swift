//
//  BillTableViewCell.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 15/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol BillTVEditDelegate {
    func editOrder()
}
protocol BillTVDeletDelegate {
    func deletOrder()
}

class BillTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLbl: LocalizableLabel!
    @IBOutlet weak var timeLbl: LocalizableLabel!
    @IBOutlet weak var dateLbl: LocalizableLabel!
    @IBOutlet weak var deletBu: UIButton!
    @IBOutlet weak var editBu: UIButton!
    @IBOutlet weak var serviceNameLbl: LocalizableLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var editDelegate : BillTVEditDelegate?
    var deletDelegate : BillTVDeletDelegate?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deletBuTapped(_ sender: UIButton) {
        self.deletDelegate?.deletOrder()
    }
    @IBAction func editBuTapped(_ sender: UIButton) {
        self.editDelegate?.editOrder()
    }
    
}
