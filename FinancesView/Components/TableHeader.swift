//
//  TableHeader.swift
//  FinancesView
//
//  Created by Vinicius on 15/11/22.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    
    static let identifier = "TableHeader"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Orçamento"
        label.textColor = .black
        return label
    }()
    
    lazy var addBudgetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.clipsToBounds = true
        button.tintColor = .black
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableHeader: ViewCodable {
    func buildHierarchy() {
        contentView.addSubview(headerLabel)
        contentView.addSubview(addBudgetButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),
            
            addBudgetButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addBudgetButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            addBudgetButton.heightAnchor.constraint(equalToConstant: 20),
            addBudgetButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    func applyAdditionalChanges() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
    }
    
}
