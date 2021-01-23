//
//  UITableView.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    func registerCell<Cell : UITableViewCell>(cell : Cell.Type){
        
        let nibName = String(describing: cell.self) // transform classCellName to String
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeCell<Cell : UITableViewCell>( cell : Cell) -> Cell {
        
        let cellID = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: cellID) as? Cell else{fatalError()}
        return cell
    }
}




