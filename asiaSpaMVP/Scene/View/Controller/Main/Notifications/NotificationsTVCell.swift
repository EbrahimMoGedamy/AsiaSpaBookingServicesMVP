//
//  NotificationsTVCell.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/19/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class NotificationsTVCell: UITableViewCell {

    @IBOutlet weak var dotView: UIView!{
        didSet{
            dotView.layer.cornerRadius = 10.0
        }
    }
    @IBOutlet weak var ServicevaluationLbl: LocalizableLabel!
    @IBOutlet weak var contenMsgLBl: UITextView!
    @IBOutlet weak var dayLbl: LocalizableLabel!
    @IBOutlet weak var timeLbl: LocalizableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
