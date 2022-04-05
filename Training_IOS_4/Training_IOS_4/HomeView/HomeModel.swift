//
//  HomeModel.swift
//  Training_IOS_4
//
//  Created by Pham Van Thai on 04/04/2022.
//

import Foundation
typealias Completion = (Bool) -> Void
class HomeModel {
    var listInterest: [Rate] = []
    func calculateInterest(value: Double, month: Int, persent: Double, completion: @escaping Completion) {
        listInterest.removeAll()
        var countPrincipal = value
        let count = value/Double(month)
        for i in 1...month {
            let interest = (countPrincipal * persent)/12
            if i == month {
                countPrincipal = 0
            }else {
                countPrincipal = countPrincipal - count
            }
            
            listInterest.append(Rate(month: String(i), principal: String(countPrincipal).currencyFormatting(), interest: String(interest).currencyFormatting()))
        }
        
        completion(true)
    }
}
