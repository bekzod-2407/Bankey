//
//  File.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 12/11/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }

    private func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()

        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)

        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]

        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
//
//  ExampleVC.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 17/11/22.
//

import UIKit
import SnapKit

class ExampleVC: UIViewController {
    
    var mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSubView()
        setupNSattrebutedString()
    }
    func setupNSattrebutedString() {
        var attributes : [NSAttributedString.Key: Any] = [
          .font: UIFont(name: "Baskerville", size: 15)
        ]
        addLabel(text: "Base attributes", attributes: attributes)

        // change font and size
        attributes[.font] = UIFont(name: "Chalkduster", size: 20)
        addLabel(text: "Big Chalkduster", attributes: attributes)

        // change color
        attributes[.foregroundColor] = UIColor.orange
        addLabel(text: "Orange text", attributes: attributes)

        // add a blue background
        attributes[.backgroundColor] = UIColor.blue
        addLabel(text: "Blue Background", attributes: attributes)

        // Helper function to create a new label and to add it to the view
        func addLabel(text: String, attributes: [NSAttributedString.Key: Any]) {
          let label = UILabel()
          label.attributedText = NSAttributedString(string: text, attributes: attributes)
          // set the label frame
          // add to the superview
        }
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
