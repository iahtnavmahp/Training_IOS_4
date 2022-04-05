//
//  InputTableViewCell.swift
//  Training_IOS_4
//
//  Created by Pham Van Thai on 04/04/2022.
//

import UIKit
import iOSDropDown

class InputTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tfAll: UITextField!
    @IBOutlet weak var tfDropDown: DropDown!
    @IBOutlet weak var tfLs: UITextField!
    
    var arrMonth: [String] = ["6","12","18","24","30","36"]
    var delegate: pushDataCell?
    var checkAll: Bool = false
    var checkDrop: Bool = false
    var checkLs: Bool = false
    var countMonth: Int = 0
    var countAll: Double = 0
    var countLs: Double = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configTextField()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configTextField() {
        tfAll.addTarget(self, action: #selector(formatText), for: .editingChanged)
        tfAll.addTarget(self, action: #selector(checkTfAll), for: .editingDidEnd)
        tfDropDown.optionArray = arrMonth
        tfDropDown.didSelect {(selectedText , index ,id) in
            self.countMonth = Int(selectedText) ?? 0
            if self.checkAll && self.checkLs {
                self.delegate?.passData(value: self.countAll, month: self.countMonth, persent: self.countLs)
            }
            self.checkDrop = true
        }
        tfLs.addTarget(self, action: #selector(formatPersent), for: .editingChanged)
        tfLs.addTarget(self, action: #selector(checkTfLs), for: .editingDidEnd)
    }
    
    @objc func formatText() {
        if let text = tfAll.text {
            let str = text.currencyFormatting()
            tfAll.text = str
            
        }
    }
    
    @objc func formatPersent() {
        
    }
    
    @objc func checkTfAll() {
        
        if let text = tfAll.text {
            let data = text.cutStr()
            if data > 1000000000 {
                tfAll.text = "1,000,000,000"
                self.countAll = 1000000000
            }else if data < 10000000 {
                tfAll.text = "10,000,000"
                self.countAll = 10000000
            }else {
                self.countAll = data
            }
            if checkLs && checkDrop {
                self.delegate?.passData(value: countAll, month: countMonth, persent: countLs)
            }
            checkAll = true
        }
    }
    
    @objc func checkTfLs() {
        if let text = tfLs.text {
            if let persent = Double(text) {
                self.countLs = round(persent * 100)/10000
                if self.countLs > 0 {
                    if checkAll && checkDrop {
                        self.delegate?.passData(value: countAll, month: countMonth, persent: countLs)
                    }
                    checkLs = true
                }
            }
        }
    }
}
