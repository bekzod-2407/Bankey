//
//  ViewController.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 07/10/22.
//


import UIKit

class LoginViewController: UIViewController {

    var mainLabel = UILabel()
    var subLabel = UILabel()
    var loginView = LoginView()
    var signInButton = UIButton(type: .system)
    var errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.userNameTextField.text
    }
    var password: String? {
        return loginView.passworTextField.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

   

}
extension LoginViewController {
    func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.setTitle("Sign In", for: [])
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.text = "error error error error error"
        errorMessageLabel.isHidden = true
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.textAlignment = .center
        mainLabel.text = "Bankey"
        mainLabel.textColor = .label
        
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.numberOfLines = 0
        subLabel.textAlignment = .center
        subLabel.text = "Your premium sourse for all things banking!"
        subLabel.textColor = .secondaryLabel
      
    }
    
    func layout() {
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            //login lead.acvhor  16point after view.leading anchor
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            // views trailing anchor Come after loginViews trailing anchor
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 15),
            mainLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalToSystemSpacingBelow: mainLabel.bottomAnchor, multiplier: 3),
            subLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}
extension LoginViewController {
    @objc private func signInButtonTapped() {
        errorMessageLabel.isHidden = true
        signInButton.configuration?.showsActivityIndicator = false
        logIn()
    }
    
    private func logIn() {
        guard let username = username, let password = password else {
            assertionFailure("username passsword never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(with: "username / password connot be blank")
            signInButton.configuration?.showsActivityIndicator = false
            signInButton.configuration?.imagePadding = 8
            return
        }
        if username == "Bekzod" && password == "123" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            signInButton.configuration?.showsActivityIndicator = false
            configureView(with: "Incorrect username / password")
        }
    }
    private func configureView(with message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
