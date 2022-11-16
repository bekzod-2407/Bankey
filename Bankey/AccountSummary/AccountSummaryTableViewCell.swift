//
//  AccountSummaryTableViewCell.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 13/11/22.
//

import UIKit
import SnapKit

class AccountSummaryTableViewCell: UITableViewCell {
    
    var appLabel = UILabel()
    var dividerView = UIView()
    var nameLabel = UILabel()
    
    var balanceLabel = UILabel()
    var balanceAmmountLabel = UILabel()
    var chevronImageView = UIImageView()
    
    lazy var balancelabelStack = UIStackView(arrangedSubviews: [balanceLabel, balanceAmmountLabel])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(appLabel)
        contentView.addSubview(dividerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(balancelabelStack)
        contentView.addSubview(chevronImageView)
        
        appLabel.font = .preferredFont(forTextStyle: .caption1)
        appLabel.text = "Accaunt type"
        appLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
        }
        
        dividerView.backgroundColor = appColor
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(appLabel.snp.bottom).offset(8)
            make.height.equalTo(4)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(60)
        }
        
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.text = "No-Feel all-In Chequing"
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        balanceLabel.text = "Current Balance"
        balanceLabel.font = .preferredFont(forTextStyle: .callout)
        balancelabelStack.spacing = 0
        balancelabelStack.axis = .vertical
        balanceAmmountLabel.text = "$ 17,675.35"
        balanceAmmountLabel.font = .preferredFont(forTextStyle: .callout)
        balanceAmmountLabel.textAlignment = .right
        
        balancelabelStack.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom)
            make.leading.equalTo(nameLabel.snp.trailing).inset(5)
            make.trailing.equalToSuperview().inset(32)
        }
        
        chevronImageView.image = .init(systemName: "chevron.forward")
        
        chevronImageView.snp.makeConstraints { v in
            v.top.equalTo(dividerView.snp.bottom).offset(8)
            v.trailing.equalToSuperview().inset(12)
            v.leading.equalTo(balancelabelStack.snp.trailing).offset(8)
        }
    }
}

extension AccountSummaryTableViewCell {
    func configure(with data: AccountSummaryModel) {
        nameLabel.text = data.accauntName
        appLabel.text = data.accauntType.rawValue
        
        switch data.accauntType {
        case .Banking:
            dividerView.backgroundColor =  appColor
        case .CreditCards:
            dividerView.backgroundColor = .orange
        case .Investment:
            dividerView.backgroundColor = .systemPurple
        }
    }
}
