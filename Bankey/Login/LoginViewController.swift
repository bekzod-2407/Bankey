//
//  ViewController.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 07/10/22.
//


import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {

    var mainLabel = UILabel()
    var subLabel = UILabel()
    var loginView = LoginView()
    var signInButton = UIButton(type: .system)
    var errorMessageLabel = UILabel()
    
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgesOfScreen: CGFloat = -1000
    var titleLeadingAnchorConstraints: NSLayoutConstraint?
    var subtitleLeadingAnchorConstraints: NSLayoutConstraint?
    
    weak var delegate: LoginViewControllerDelegate?
    
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
        loginView.userNameTextField.text = ""
        loginView.passworTextField.text = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginView.userNameTextField.becomeFirstResponder()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateLabels()
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
        mainLabel.font = .preferredFont(forTextStyle: .largeTitle)
        mainLabel.alpha = 0
        
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.numberOfLines = 0
        subLabel.textAlignment = .center
        subLabel.text = "Your premium sourse for all things banking!"
        subLabel.textColor = .secondaryLabel
        subLabel.alpha = 0
      
    }
    
    func layout() {
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subLabel.bottomAnchor, multiplier: 10),
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
            mainLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalToSystemSpacingBelow: mainLabel.bottomAnchor, multiplier: 3),
            subLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        titleLeadingAnchorConstraints = mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgesOfScreen)
        titleLeadingAnchorConstraints?.isActive = true
        
        subtitleLeadingAnchorConstraints = subLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leadingEdgesOfScreen)
        subtitleLeadingAnchorConstraints?.isActive = true
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
        if username == "1" && password == "q" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            signInButton.configuration?.showsActivityIndicator = false
            configureView(with: "Incorrect username / password")
        }
    }
    private func configureView(with message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
        shakeLogInButton()
    }
    private func shakeLogInButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.duration = 0.5
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake-Button")
    }
    
    private func animateLabels() {
        let duration = 0.8
        let animator  = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLeadingAnchorConstraints?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.subtitleLeadingAnchorConstraints?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 1)
        
        let alphaAnimator = UIViewPropertyAnimator(duration: duration*3 , curve: .easeInOut) {
            self.mainLabel.alpha = 1
            self.subLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        alphaAnimator.startAnimation(afterDelay: 1)
    }
}
