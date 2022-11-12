//
//  DummyViewController.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 12/11/22.
//

import Foundation
import UIKit
protocol LogOutDelegate: AnyObject {
    func didLogOut()
}

class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let logOutButton = UIButton(type: .system)
    weak var delegate: LogOutDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dummy"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        let logoutButton = UIButton(type: .system)

        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)

        stackView.addArrangedSubview(logoutButton)

        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func logoutButtonTapped(sender: UIButton) {
        delegate?.didLogOut()
    }
}
