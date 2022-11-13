//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 13/11/22.
//

import UIKit
import SnapKit

class AccountSummaryViewController: UIViewController {
    
    var mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
    }
    
    private func setupSubView() {
        view.addSubview(mainLabel)
        
        mainLabel.text = "welcome"
        mainLabel.snp.makeConstraints { v in
            v.left.right.equalToSuperview()
            v.centerY.equalToSuperview()
        }
    }
    
}

