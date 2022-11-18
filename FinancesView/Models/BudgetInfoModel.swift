//
//  BudgetInfoModel.swift
//  FinancesView
//
//  Created by Vinicius on 15/11/22.
//

import Foundation

struct BudgetInfo: Codable {
    let item: String
    let updatedValue: String
    let goalValue: String
    
}

typealias BudgetData = [BudgetInfo]
