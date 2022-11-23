//
//  NewRevenueViewController.swift
//  FinancesView
//
//  Created by Vinicius on 18/11/22.
//

import UIKit

protocol NewRevenueViewControllerProtocol: AnyObject {
    func updateBudget(value: Double)
}

class NewRevenueViewController: UIViewController {
    
    private weak var delegate: NewRevenueViewControllerProtocol?
    
    func subscribeDelegate(delegate: NewRevenueViewControllerProtocol) {
        self.delegate = delegate
    }
    var newRevenueView: NewRevenueView?
    
    override func loadView() {
        self.newRevenueView = NewRevenueView()
        self.view = newRevenueView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Nova Receita"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: self, action: #selector(tappedBarButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tappedSaveButton))
    }
    
    func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func tappedBarButton() {
        dismiss(animated: true)
    }
    
    @objc private func tappedSaveButton() {
        guard let nameTF = newRevenueView?.stackView.nameTF.text, !nameTF.isEmpty else {
            alert(title: "Ops", message: "Campo Nome vazio, por favor preencha.")
            return
        }
        
        guard let valueTF = newRevenueView?.stackView.valueTF.text, !valueTF.isEmpty else {
            alert(title: "Ops", message: "Campo Valor vazio, por favor preencha.")
            return
        }
        
        guard let categoryTF = newRevenueView?.categoryTF.text, !categoryTF.isEmpty else {
            alert(title: "Ops", message: "Categoria vazia, por favor preencha.")
            return
        }
        guard let valueDouble = Double(valueTF) else { return }
        StoreValues.shared.storeRevenue.append(valueDouble)
        
        let expense = StoreValues.shared.storeExpense.reduce(0, +)
        let revenue = StoreValues.shared.storeRevenue.reduce(0, +)
        let balance = revenue - expense
        
        self.delegate?.updateBudget(value: balance)
        dismiss(animated: true)
        
    }
}

