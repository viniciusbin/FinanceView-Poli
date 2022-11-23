//
//  BudgetView.swift
//  FinancesView
//
//  Created by Vinicius on 10/11/22.
//

import UIKit

class BudgetView: UIView {

    lazy var lineviewBudget: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var myBudgetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Meu Saldo"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var updatedBudgetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "R$ 0,00"
        label.textColor = .black
        return label
    }()
    
    lazy var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Última atualização"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "09:40"
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        let currentDateTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        let timeString = dateFormatter.string(from: currentDateTime)
        timeLabel.text = timeString
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension BudgetView: ViewCodable {
    func buildHierarchy() {
        addSubview(myBudgetLabel)
        addSubview(updatedBudgetLabel)
        addSubview(lineviewBudget)
        addSubview(lastUpdateLabel)
        addSubview(timeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            myBudgetLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            myBudgetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            myBudgetLabel.heightAnchor.constraint(equalToConstant: 30),

            updatedBudgetLabel.topAnchor.constraint(equalTo: myBudgetLabel.bottomAnchor, constant: 4),
            updatedBudgetLabel.leadingAnchor.constraint(equalTo: myBudgetLabel.leadingAnchor),
            updatedBudgetLabel.heightAnchor.constraint(equalToConstant: 30),

            lineviewBudget.topAnchor.constraint(equalTo: updatedBudgetLabel.bottomAnchor, constant: 2),
            lineviewBudget.leadingAnchor.constraint(equalTo: myBudgetLabel.leadingAnchor),
            lineviewBudget.heightAnchor.constraint(equalToConstant: 1),
            lineviewBudget.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),

            lastUpdateLabel.topAnchor.constraint(equalTo: lineviewBudget.bottomAnchor, constant: 4),
            lastUpdateLabel.leadingAnchor.constraint(equalTo: myBudgetLabel.leadingAnchor),
            lastUpdateLabel.heightAnchor.constraint(equalToConstant: 30),

            timeLabel.centerYAnchor.constraint(equalTo: lastUpdateLabel.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            timeLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    func applyAdditionalChanges() {
        self.backgroundColor = .white
    }
}
