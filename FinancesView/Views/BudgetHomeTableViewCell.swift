//
//  BudgetHomeTableViewCell.swift
//  FinancesView
//
//  Created by Vinicius on 14/11/22.
//

import UIKit

class BudgetHomeTableViewCell: UITableViewCell {
    
    static let identifier = "BudgetHomeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Novo carro"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var updatedValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 2.000,00"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .red
        return label
    }()
    
    private lazy var goalValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 80.000,00"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .blue
        return label
    }()
    
    lazy var lineviewBudget: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
}

extension BudgetHomeTableViewCell: ViewCodable {
    
    public func configure(with budgetInfo: BudgetInfo) {
        self.itemLabel.text = budgetInfo.item
        self.updatedValueLabel.text = budgetInfo.updatedValue
        self.goalValueLabel.text = budgetInfo.goalValue
    }
    
    func buildHierarchy() {
        contentView.addSubview(itemLabel)
        contentView.addSubview(lineviewBudget)
        contentView.addSubview(updatedValueLabel)
        contentView.addSubview(goalValueLabel)
    }
    
    
    func setupConstraints() {
        let cv = contentView
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: cv.topAnchor, constant: 4),
            itemLabel.leadingAnchor.constraint(equalTo: cv.leadingAnchor, constant: 8),
            itemLabel.trailingAnchor.constraint(equalTo: cv.trailingAnchor, constant: -8),
            itemLabel.heightAnchor.constraint(equalToConstant: 25),
            
            lineviewBudget.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 3),
            lineviewBudget.leadingAnchor.constraint(equalTo: itemLabel.leadingAnchor),
            lineviewBudget.trailingAnchor.constraint(equalTo: itemLabel.trailingAnchor),
            lineviewBudget.heightAnchor.constraint(equalToConstant: 5),
            
            
            updatedValueLabel.topAnchor.constraint(equalTo: lineviewBudget.bottomAnchor, constant: 6),
            updatedValueLabel.leadingAnchor.constraint(equalTo: cv.leadingAnchor, constant: 8),
            updatedValueLabel.bottomAnchor.constraint(equalTo: cv.bottomAnchor, constant: -8),
            updatedValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            goalValueLabel.topAnchor.constraint(equalTo: lineviewBudget.bottomAnchor, constant: 6),
            goalValueLabel.trailingAnchor.constraint(equalTo: cv.trailingAnchor, constant: -8),
            goalValueLabel.centerYAnchor.constraint(equalTo: updatedValueLabel.centerYAnchor),
            goalValueLabel.bottomAnchor.constraint(equalTo: cv.bottomAnchor, constant: -8),
            goalValueLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
