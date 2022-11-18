//
//  HomeView.swift
//  FinancesView
//
//  Created by Vinicius on 14/11/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func actionRevenueButton()
    func actionExpenseButton()
}

class HomeView: UIView {
    
    private weak var delegate: HomeViewProtocol?
    
    func delegate(delegate: HomeViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var budgetView: BudgetView = {
        let view = BudgetView()
        view.translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        return view
    }()
    
    lazy var newRevenueButton: GenericButton = {
        let button = GenericButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configureButton(image: "plus", text: "Nova Receita")
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(tappedNewRevenueButton), for: .touchUpInside)
        return button
    }()
    
    lazy var newExpenseButton: GenericButton = {
        let button = GenericButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configureButton(image: "minus", text: "Nova Despesa")
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tappedNewExpenseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BudgetHomeTableViewCell.self, forCellReuseIdentifier: BudgetHomeTableViewCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedNewRevenueButton() {
        self.delegate?.actionRevenueButton()
    }
    
    @objc private func tappedNewExpenseButton() {
        self.delegate?.actionExpenseButton()
    }
}

extension HomeView: ViewCodable {
    func buildHierarchy() {
        addSubview(budgetView)
        addSubview(newRevenueButton)
        addSubview(newExpenseButton)
        addSubview(tableView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            budgetView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            budgetView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            budgetView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            budgetView.heightAnchor.constraint(equalToConstant: 110),
            
            newRevenueButton.topAnchor.constraint(equalTo: budgetView.bottomAnchor, constant: 16),
            newRevenueButton.leadingAnchor.constraint(equalTo: budgetView.leadingAnchor, constant: 16),
            newRevenueButton.heightAnchor.constraint(equalToConstant: 75),
            newRevenueButton.widthAnchor.constraint(equalToConstant: 175),
            
            newExpenseButton.topAnchor.constraint(equalTo: budgetView.bottomAnchor, constant: 16),
            newExpenseButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            newExpenseButton.heightAnchor.constraint(equalToConstant: 75),
            newExpenseButton.widthAnchor.constraint(equalToConstant: 175),
            
            tableView.topAnchor.constraint(equalTo: newExpenseButton.bottomAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
    }
}



