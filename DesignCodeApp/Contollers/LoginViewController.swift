//
//  LoginViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/6/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class LoginViewController: UIViewController {
    
    let backgroundView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: TPKeyboardAvoidingScrollView = {
        let view = TPKeyboardAvoidingScrollView(frame: UIScreen.main.bounds)
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    let dialogView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.layer.shadowRadius = 15
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        return view
    }()
    
    let innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    let logoView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "More/logo-medium")
        return iv
    }()
    
    // email input field
    let emailInputView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let emailImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "More/email")
        return iv
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = UITextField.BorderStyle.none
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.isSecureTextEntry = false
        textField.placeholder = "Email"
        return textField
    }()
    
    // password input field
    let passwordInputView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let passwordImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "More/password")
        return iv
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = UITextField.BorderStyle.none
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    
    // email password stackview
    let emailPasswordStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    // password recovery button
    let passRecoveryBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Forgot your password?", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        return btn
    }()
    
    // login btn
    let loginBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.431372549, blue: 0.9490196078, alpha: 1)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.layer.cornerRadius = 14
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.25
        return btn
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .clear
        view.addSubview(backgroundView)
        view.addSubview(scrollView)
        scrollView.addSubview(dialogView)
        dialogView.addSubview(innerView)
        innerView.addSubview(logoView)
        innerView.addSubview(emailPasswordStackView)
        
        emailPasswordStackView.addArrangedSubview(emailInputView)
        emailPasswordStackView.addArrangedSubview(passwordInputView)
        
        emailInputView.addSubview(emailImageView)
        emailInputView.addSubview(emailTextField)
        
        passwordInputView.addSubview(passwordImageView)
        passwordInputView.addSubview(passwordTextField)
        
        innerView.addSubview(passRecoveryBtn)
        innerView.addSubview(loginBtn)
        
        // Constraints
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            dialogView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            dialogView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            dialogView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            dialogView.heightAnchor.constraint(equalToConstant: 340),
            dialogView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            dialogView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            innerView.topAnchor.constraint(equalTo: dialogView.topAnchor),
            innerView.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor),
            innerView.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor),
            innerView.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor),
            
            logoView.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 30),
            logoView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            
            emailPasswordStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 30),
            emailPasswordStackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor),
            emailPasswordStackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor),
            
            emailInputView.heightAnchor.constraint(equalToConstant: 60),
            
            emailImageView.leadingAnchor.constraint(equalTo: emailInputView.leadingAnchor, constant: 19),
            emailImageView.centerYAnchor.constraint(equalTo: emailInputView.centerYAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailInputView.trailingAnchor, constant: -10),
            emailTextField.topAnchor.constraint(equalTo: emailInputView.topAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: emailInputView.bottomAnchor),
            
            passwordInputView.heightAnchor.constraint(equalToConstant: 60),

            passwordImageView.leadingAnchor.constraint(equalTo: passwordInputView.leadingAnchor, constant: 19),
            passwordImageView.centerYAnchor.constraint(equalTo: passwordInputView.centerYAnchor),

            passwordTextField.leadingAnchor.constraint(equalTo: passwordImageView.trailingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordInputView.trailingAnchor, constant: -10),
            passwordTextField.topAnchor.constraint(equalTo: passwordInputView.topAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordInputView.bottomAnchor),
            
            passRecoveryBtn.topAnchor.constraint(equalTo: emailPasswordStackView.bottomAnchor, constant: 8),
            passRecoveryBtn.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            loginBtn.topAnchor.constraint(equalTo: passRecoveryBtn.bottomAnchor, constant: 20),
            loginBtn.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20),
            loginBtn.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -20),
            
        ])
    }
    
    

}
