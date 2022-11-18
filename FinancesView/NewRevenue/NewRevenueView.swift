//
//  NewRevenueView.swift
//  FinancesView
//
//  Created by Vinicius on 18/11/22.
//

import UIKit

class NewRevenueView: UIView {
    
    let categories = ["Nenhum", "Novo carro", "TV", "Férias no Guarujá"]
    
    lazy var stackView: CustomStackView = {
        let stack = CustomStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    lazy var categoryTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Categorias"
        textfield.backgroundColor = .white
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 2
        textfield.inputView = pickerView
        return textfield
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewRevenueView: ViewCodable {
    func buildHierarchy() {
        stackView.addArrangedSubview(categoryTF)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            categoryTF.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
    }
}

extension NewRevenueView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTF.text = categories[row]
        categoryTF.resignFirstResponder()
    }
    
}

