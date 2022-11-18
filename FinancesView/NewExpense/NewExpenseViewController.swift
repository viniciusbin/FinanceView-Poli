//
//  NewExpenseViewController.swift
//  FinancesView
//
//  Created by Vinicius on 16/11/22.
//

import UIKit

class NewExpenseViewController: UIViewController {
    
    var newExpenseView: NewExpenseView?
    
    override func loadView() {
        self.newExpenseView = NewExpenseView()
        self.view = newExpenseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Nova Despesa"
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
        guard let nameTF = newExpenseView?.stackViewExpense.nameTF.text, !nameTF.isEmpty else {
            alert(title: "Ops", message: "Campo Nome vazio, por favor preencha.")
            return
        }
        guard let valueTF = newExpenseView?.stackViewExpense.valueTF.text, !valueTF.isEmpty else {
            alert(title: "Ops", message: "Campo Valor vazio, por favor preencha.")
            return
        }
        print("Tocou salvar")
    }
}