//
//  MassageVC+TableView.swift
//  asiaSpaMVP
//
//  Created by Ebrahim  Mo Gedamy on 5/20/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension MassageVC : UITableViewDataSource{
    
    func setUpTableView(tableView : UITableView) {
        if tableView == servicesTableView{
            servicesTableView.delegate = self
            servicesTableView.dataSource = self
            servicesTableView.tableFooterView = UIView()
            servicesTableView.separatorColor = .clear
            servicesTableView.registerCell(cell: ServicesTableViewCell.self)
        }else{
            unPaidServicesTableView.delegate = self
            unPaidServicesTableView.dataSource = self
            unPaidServicesTableView.tableFooterView = UIView()
            unPaidServicesTableView.separatorColor = .clear
            unPaidServicesTableView.registerCell(cell: UnpaiedServicesTableViewCell.self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.massagePre?.tableServiceData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell", for: indexPath) as? ServicesTableViewCell {
            cell.titleLbl.text = self.massagePre?.tableServiceData[indexPath.row].name
            cell.descriptionTxt.text = self.singleSubservice?.desc
            cell.priceLbl.text = "\(self.singleSubservice?.price ?? 0)"
            cell.delegate = self
            AF.request("\(self.singleSubservice?.image ?? "")").responseImage { response in
                if case .success(let image) = response.result {
                    cell.serviceImage.image = image
                }
            }
            cell.titleLbl.layer.cornerRadius = 10.0
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapse == true {
            return 400
        }
        return 55
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
  
}

extension MassageVC : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row {
            if self.isCollapse == false {
                self.isCollapse = true
            }else{
                self.isCollapse = false
            }
        }else{
            self.isCollapse = true
        }
        self.selectedIndex = indexPath.row
        self.servicesTableView.reloadRows(at: [indexPath], with: .fade)
        
        self.subServiceId = self.massagePre?.tableServiceData[indexPath.row].id ?? 0
        let userId = Helper.getApiID()
        let lang = "en"
        
        let paramters = ["service_id" : id , "type" : type ,
                         "user_id" : userId ?? 0 , "lang" : lang ,"subservice_id" : subServiceId] as [String : Any]
        print(paramters)
        
        guard let url = URL(string: URLs.subServicesURL ) else {
            print("error in subServicesURL")
            return
        }
        AF.request(url, method: .post, parameters: paramters)
            .responseJSON(completionHandler: {  (response) in
                print("URL : \(url)")
                do{
                    let jsonData = try JSONDecoder().decode(SubServicesDataModel.self, from: response.data! )
                    self.singleSubservice = jsonData.singleSubservice
                    DispatchQueue.main.async {
                        self.servicesTableView.reloadData()
                    }
                }catch{}
            }
        )}
}

