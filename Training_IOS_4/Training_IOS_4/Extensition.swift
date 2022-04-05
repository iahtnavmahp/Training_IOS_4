//
//  Extensition.swift
//  Training_IOS_4
//
//  Created by Pham Van Thai on 04/04/2022.
//

import UIKit

extension String {
    
    func currencyFormatting() -> String {
        let convertNumber = self.replacingOccurrences(of: ",", with: "")
        if let value = Double(convertNumber) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            formatter.minimumFractionDigits = 0
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
    
    func cutStr() -> Double {
        let convertNumber = self.replacingOccurrences(of: ",", with: "")
        if let value = Double(convertNumber) {
            return value
        }
        return 0
    }
}
