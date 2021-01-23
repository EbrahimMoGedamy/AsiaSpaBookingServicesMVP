//
//  EmployeeTableViewCell.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 20/11/2020.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

//protocol EmployeeTableViewCellProtocol : class{
//    func getUserImg(img: UIImage)
//}

class EmployeeTableViewCell: UITableViewCell{

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var commentContent: LocalizableLabel!
    @IBOutlet weak var time: LocalizableLabel!
    @IBOutlet weak var name: LocalizableLabel!
    
//    var employe : EmployeeDetailsPresenter?
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.layer.cornerRadius = 10
//        employe = EmployeeDetailsPresenter(emp: self)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//extension EmployeeTableViewCell : EmployeeTableViewCellProtocol{
//    func getUserImg(img: UIImage) {
//        profileImg.image = img
//    }
//}
