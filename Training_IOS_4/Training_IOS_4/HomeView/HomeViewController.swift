//
//  HomeViewController.swift
//  Training_IOS_4
//
//  Created by Pham Van Thai on 04/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var dataModel = HomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
    }
    
    func configTableView() {
        let nibInput = UINib(nibName: "InputTableViewCell", bundle: nil)
        myTableView.register(nibInput, forCellReuseIdentifier: "InputTableViewCell")
        let nibDetail = UINib(nibName: "DetailTableViewCell", bundle: nil)
        myTableView.register(nibDetail, forCellReuseIdentifier: "DetailTableViewCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.keyboardDismissMode = .onDrag
    }
    
    func getData(value: Double, month: Int, persent : Double) {
        dataModel.calculateInterest(value: value, month: month, persent: persent){ done in
            if done {
                self.myTableView.reloadSections([1], with: .automatic)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return dataModel.listInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputTableViewCell", for: indexPath) as! InputTableViewCell
            cell.delegate = self
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
            if dataModel.listInterest.count > indexPath.row {
                cell.lblMonth.text = "Tháng: " + (dataModel.listInterest[indexPath.row].month)
                cell.lblG.text = "Gốc: " + (dataModel.listInterest[indexPath.row].principal)
                cell.lblLs.text = "Lãi: " + (dataModel.listInterest[indexPath.row].interest)
            }
            
            return cell
        }
    }
}

extension HomeViewController: pushDataCell {
    
    func passData(value: Double, month: Int, persent: Double) {
        getData(value: value, month: month, persent: persent)
    }
    
}
