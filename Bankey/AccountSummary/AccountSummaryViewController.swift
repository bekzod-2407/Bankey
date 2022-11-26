//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 13/11/22.
//

import UIKit
import SnapKit

enum AccountType: String {
    case Banking
    case CreditCard
    case Investment
}

struct AccountSummaryModel {
    var accauntType: AccountType
    var accauntName: String
    let balance: Decimal
    
    var balanceAsAttributedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
}


class AccountSummaryViewController: UIViewController {
    
    var tableView = UITableView()
    var accauntData: [AccountSummaryModel] = []
    
   lazy var LogOutBarButton: UIBarButtonItem = {
        var view = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(logOutButtonTapped))
        view.tintColor = .label
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appColor
        setupSubView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountSummaryTableViewCell.self, forCellReuseIdentifier: "Cell")
        setupTableViewHeaderView()
        fetchData()
    }
  
    var accauntSummaryModel: AccountSummaryModel? = nil
    
    private func setupSubView() {
        view.addSubview(tableView)
        tableView.backgroundColor = appColor
        tableView.snp.makeConstraints { v in
            v.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            v.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            v.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            v.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        navigationItem.rightBarButtonItem = LogOutBarButton
    }
    
    private func setupTableViewHeaderView() {
        let headerView = AccountSummaryHeaderView(frame: .zero)
        headerView.backgroundColor = appColor
        headerView.frame.size.height = 180
        tableView.tableHeaderView = headerView
    }
   
    @objc func logOutButtonTapped(sender: UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}

extension AccountSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func fetchData() {
        let savings = AccountSummaryModel(accauntType: .Banking,accauntName: "Basic Savings",balance: 929466.23)
        let chequing = AccountSummaryModel(accauntType: .Banking,accauntName: "No-Fee All-In Chequing",balance: 17562.44)
        let visa = AccountSummaryModel(accauntType: .CreditCard,accauntName: "Visa Avion Card",balance: 412.83)
        let masterCard = AccountSummaryModel(accauntType: .CreditCard,accauntName: "Student Mastercard",balance: 50.83)
        let investment1 = AccountSummaryModel(accauntType: .Investment, accauntName: "Tax-Free Saver", balance: 2000.00)
        let investment2 = AccountSummaryModel(accauntType: .Investment, accauntName: "Growth Fund", balance: 15000.00)
       
        accauntData.append(savings)
        accauntData.append(chequing)
        accauntData.append(visa)
        accauntData.append(masterCard)
        accauntData.append(investment1)
        accauntData.append(investment2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AccountSummaryTableViewCell
        let accaunt = accauntData[indexPath.row]
        cell.configure(with: accaunt)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accauntData.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}

