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
    case CreditCards
    case Investment
}

struct AccountSummaryModel {
    var accauntType: AccountType
    var accauntName: String
}


class AccountSummaryViewController: UIViewController {
    
    var tableView = UITableView()
    var accauntData: [AccountSummaryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        tableView.snp.makeConstraints { v in
            v.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            v.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            v.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            v.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setupTableViewHeaderView() {
        let headerView = AccountSummaryHeaderView(frame: .zero)
        headerView.backgroundColor = appColor
        headerView.frame.size.height = 140
        tableView.tableHeaderView = headerView
    }
}

extension AccountSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func fetchData() {
        let saving = AccountSummaryModel(accauntType: .Banking, accauntName: "Savings")
        let visa = AccountSummaryModel(accauntType: .CreditCards, accauntName: "Avion Visa Card")
        let investment = AccountSummaryModel(accauntType: .Investment, accauntName: "Tax-Free Saver")
        
        accauntData.append(saving)
        accauntData.append(visa)
        accauntData.append(investment)
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

