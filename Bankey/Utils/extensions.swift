//
//  extensions.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 12/11/22.
//

import Foundation
import UIKit

extension UIViewController {

    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
        navBarAppearance.backgroundColor = appColor
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }

    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

extension Notification.Name {
    static let logout = Notification.Name("Logout")
}

let passwordToggleButton = UIButton(type: .custom)
extension UITextField {
    
    func enablePasswordToggle() {
        passwordToggleButton.setImage(.init(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(.init(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
