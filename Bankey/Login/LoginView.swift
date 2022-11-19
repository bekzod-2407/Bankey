//
//  LoginView.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 07/10/22.
//

import UIKit

class LoginView: UIView {
    
    var userNameTextField = UITextField()
    var passworTextField = UITextField()
    var vStack = UIStackView()
    var divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    override var intrinsicContentSize: CGSize {
    //  размер по умолчанию, который хочет получить контролируемый объект
    //        return CGSize(width: 200, height: 200)
    //    }
    
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        addSubview(vStack)
        
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.spacing =  8
        vStack.addArrangedSubview(userNameTextField)
        vStack.addArrangedSubview(divider)
        vStack.addArrangedSubview(passworTextField)
        
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.delegate = self
        userNameTextField.placeholder = " Username"
        
        divider.backgroundColor = .systemFill
        
        passworTextField.translatesAutoresizingMaskIntoConstraints = false
        passworTextField.delegate = self
        passworTextField.placeholder = " Password"
        passworTextField.isSecureTextEntry = true
        passworTextField.enablePasswordToggle()
    }
    func layout() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            vStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: userNameTextField.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: vStack.bottomAnchor, multiplier: 1),
            divider.heightAnchor.constraint(equalToConstant: 2)
            
        ])
    }
    
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            userNameTextField.endEditing(true)
            passworTextField.becomeFirstResponder()
        default:
            textField.endEditing(true)
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
