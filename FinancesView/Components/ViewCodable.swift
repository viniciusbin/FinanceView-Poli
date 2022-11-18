//
//  ViewCodable.swift
//  FinancesView
//
//  Created by Vinicius on 11/11/22.
//

import UIKit

public protocol ViewCodable {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

public extension ViewCodable {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    func applyAdditionalChanges() {}
}
