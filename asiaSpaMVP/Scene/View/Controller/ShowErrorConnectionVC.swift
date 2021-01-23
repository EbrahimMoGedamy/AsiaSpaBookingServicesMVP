//
//  ShowErrorConnectionVC.swift
//  asiaSpaMVP
//
//  Created by Ibrahim Mo Gedami on 08/01/2021.
//  Copyright © 2021 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class ShowErrorConnectionVC: UIViewController {
    
    
    override func viewDidLoad() {
        showHideAlert(title: "Failed", message: "Sorry! check your internet connection.")
        //Alert.showAlertOnVC(target: self, title: "Failed", message: "Sorry! check your internet connection.")
    }
    

}
