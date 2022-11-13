//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 13/11/22.
//

import UIKit
import SnapKit

class AccountSummaryViewController: UIViewController {
    
    var tableView = UITableView()
    var names = ["a", "V" , "C"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountSummaryTableViewCell.self, forCellReuseIdentifier: "Cell")
        setupTableViewHeaderView()
    }
    
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AccountSummaryTableViewCell

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}

