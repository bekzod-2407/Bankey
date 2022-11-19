//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 13/11/22.
//

import UIKit
import SnapKit

class AccountSummaryHeaderView: UIView {
    
    var appLabel = UILabel()
    var subtitle = UILabel()
    var nameLabel = UILabel()
    var dateLabel = UILabel()
    
    lazy var labelStackView = UIStackView(arrangedSubviews: [appLabel,subtitle,nameLabel,dateLabel])
    
    var sunImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(labelStackView)
        addSubview(sunImage)
        
        appLabel.text = "Bankey"
        appLabel.font = .monospacedDigitSystemFont(ofSize: 22, weight: .bold)
        subtitle.text = "Good moning"
        subtitle.font = .monospacedDigitSystemFont(ofSize: 18, weight: .regular)
        nameLabel.text = "Roman"
        nameLabel.font = .monospacedDigitSystemFont(ofSize: 18, weight: .regular)
        dateLabel.text = "22.02.22"
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 10
        labelStackView.snp.makeConstraints { v in
            v.top.leading.bottom.equalToSuperview().inset(5)
//            v.trailing.equalTo(sunImage.snp.leading)
        }
        sunImage.tintColor = .yellow
        sunImage.image = .init(systemName: "sun.max.fill")
        sunImage.contentMode = .scaleAspectFit
        sunImage.snp.makeConstraints { v in
            v.top.trailing.bottom.equalToSuperview().inset(16)
            v.width.equalTo(140)
        }
    }

}


