//
//  NewExpenseView.swift
//  FinancesView
//
//  Created by Vinicius on 16/11/22.
//

import UIKit



class NewExpenseView: UIView {
    
    lazy var stackViewExpense: CustomStackView = {
        let stack = CustomStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .equalSpacing
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewExpenseView: ViewCodable {
    func buildHierarchy() {
        addSubview(stackViewExpense)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewExpense.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackViewExpense.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackViewExpense.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
    }
    
}
