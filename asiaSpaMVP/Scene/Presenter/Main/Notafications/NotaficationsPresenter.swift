//
//  NotaficationsPresenter.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class NotaficationsPresenter{
    
    weak var notaficationsPro : NotificationsProtocol?
    
    init(notification : NotificationsProtocol) {
        self.notaficationsPro = notification
    }
}
