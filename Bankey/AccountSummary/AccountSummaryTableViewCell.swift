//
//  AccountSummaryTableViewCell.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 13/11/22.
//

import UIKit

class AccountSummaryTableViewCell: UITableViewCell {
    
    var appLabel = UILabel()
    var dividerView = UIView()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
            
    }
    
    
}
