//
//  HomeViewController.swift
//  FinancesView
//
//  Created by Vinicius on 08/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    var budgetInfo = [BudgetInfo]()
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView?.tableView.delegate = self
        homeView?.tableView.dataSource = self
        homeView?.delegate(delegate: self)
        title = "Minhas Finanças"
        fillData()
    }
    
    private func fillData() {
        budgetInfo.append(contentsOf: [
            BudgetInfo(item: "Novo Carro", updatedValue: "2.000,00", goalValue: "80.000,00"),
            BudgetInfo(item: "TV", updatedValue: "3.000,00", goalValue: "4.000,00"),
            BudgetInfo(item: "Férias", updatedValue: "2,00", goalValue: "40.000,00")
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(budgetInfo.count)
        return budgetInfo.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BudgetHomeTableViewCell.identifier, for: indexPath) as! BudgetHomeTableViewCell
        let budgetIndex = budgetInfo[indexPath.row]
        cell.configure(with: budgetIndex)
        return cell
        
    }
}

extension HomeViewController: HomeViewProtocol {
    func actionRevenueButton() {
        let navVC = UINavigationController(rootViewController: NewRevenueViewController())
        navVC.navigationBar.prefersLargeTitles = true
        navVC.navigationBar.backgroundColor = .white
        self.navigationController?.present(navVC, animated: true)
    }
    
    func actionExpenseButton() {
        let navVC = UINavigationController(rootViewController: NewExpenseViewController())
        navVC.navigationBar.prefersLargeTitles = true
        navVC.navigationBar.backgroundColor = .white
        self.navigationController?.present(navVC, animated: true)
        
    }
}



