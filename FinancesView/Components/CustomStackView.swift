//
//  CustomStackView.swift
//  FinancesView
//
//  Created by Vinicius on 18/11/22.
//

import UIKit

class CustomStackView: UIStackView {
    
    lazy var nameTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Nome"
        textfield.backgroundColor = .white
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 2
        return textfield
    }()
    
    lazy var valueTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Valor"
        textfield.backgroundColor = .white
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 2
        textfield.keyboardType = .decimalPad
        return textfield
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CustomStackView: ViewCodable {
    func buildHierarchy() {
        addArrangedSubview(nameTF)
        addArrangedSubview(valueTF)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTF.heightAnchor.constraint(equalToConstant: 35),
            
            valueTF.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func applyAdditionalChanges() {
        clipsToBounds = true
        
    }
    
}
