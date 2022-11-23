//
//  StoreValues.swift
//  FinancesView
//
//  Created by Vinicius on 22/11/22.
//

import Foundation

class StoreValues {
    
    
    static let shared = StoreValues()
    private init() {}
    var storeExpense = [Double]()
    var storeRevenue = [Double]()
    var updatedBudget = [Double]()
    
}
