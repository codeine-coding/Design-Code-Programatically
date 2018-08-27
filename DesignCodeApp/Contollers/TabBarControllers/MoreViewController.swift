//
//  MoreViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/31/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    let dialogView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    
    
    let sizingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    let myProgressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MY PROGRESS"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let iosdesignView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressRing1: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Placeholder/image-ring-1")
        return iv
    }()
    
    let progressLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100%"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    let designLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "IOS Design"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()
    
    let progressStack1: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let sketchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressRing2: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Placeholder/image-ring-2")
        return iv
    }()
    
    let progressLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100%"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    let sketchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sketch"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()
    
    let progressStack2: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let xcodeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressRing3: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Placeholder/image-ring-3")
        return iv
    }()
    let progressLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100%"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    let xcodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Xcode"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()
    
    let progressStack3: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let ringStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let loginBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.setImage(UIImage(named: "More/logo"), for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    let updatesBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Updates", for: .normal)
        btn.setImage(UIImage(named: "More/info"), for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.backgroundColor = .white
        return btn
    }()
    
    let readBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Read on Safari", for: .normal)
        btn.setImage(UIImage(named: "More/safari"), for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(safariButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let communityBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Community", for: .normal)
        btn.setImage(UIImage(named: "More/community"), for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(communityButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let emailBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("EmailSupport", for: .normal)
        btn.setImage(UIImage(named: "More/email"), for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.backgroundColor = .white
        return btn
    }()
    
    let ambienceBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Ambience", for: .normal)
        btn.setImage(UIImage(named: "More/ambience"), for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.backgroundColor = .white
        return btn
    }()
    
    
    let actionStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        return stack
    }()
    
    // stack view for hR view
    let topStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        return stack
    }()
    let middleStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        return stack
    }()
    let bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        return stack
    }()
    
    let epilogueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Only made possible with your kind support. Thank you."
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.numberOfLines = 0
        return label
    }()
    
    let twitterBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("@codeine.coding", for: .normal)
        btn.setImage(UIImage(named: "More/twitter"), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1037345852), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.addTarget(self, action: #selector(twitterHandleTapped(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    
    }
    

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(dialogView)
        dialogView.addSubview(sizingView)
        sizingView.addSubview(myProgressLabel)
        
        iosdesignView.addSubview(progressRing1)
        iosdesignView.addSubview(progressLabel1)
        progressStack1.addArrangedSubview(iosdesignView)
        progressStack1.addArrangedSubview(designLabel)
        
        sketchView.addSubview(progressRing2)
        sketchView.addSubview(progressLabel2)
        progressStack2.addArrangedSubview(sketchView)
        progressStack2.addArrangedSubview(sketchLabel)
        
        xcodeView.addSubview(progressRing3)
        xcodeView.addSubview(progressLabel3)
        progressStack3.addArrangedSubview(xcodeView)
        progressStack3.addArrangedSubview(xcodeLabel)
        
        ringStack.addArrangedSubview(progressStack1)
        ringStack.addArrangedSubview(progressStack2)
        ringStack.addArrangedSubview(progressStack3)
        sizingView.addSubview(ringStack)
        
        topStack.addArrangedSubview(loginBtn)
        topStack.addArrangedSubview(updatesBtn)
        
        middleStack.addArrangedSubview(readBtn)
        middleStack.addArrangedSubview(communityBtn)
        
        bottomStack.addArrangedSubview(emailBtn)
        bottomStack.addArrangedSubview(ambienceBtn)
        
        actionStack.addArrangedSubview(topStack)
        actionStack.addArrangedSubview(middleStack)
        actionStack.addArrangedSubview(bottomStack)
        
        sizingView.addSubview(actionStack)
        sizingView.addSubview(epilogueLabel)
        sizingView.addSubview(twitterBtn)
        
        // called from More+Constraints.swift
        displayConstraints()
    }
    
    
    @objc private func safariButtonTapped(_ sender: Any) {
        goToPage(sender: "https://designcode.io")
    }
    
    @objc private func communityButtonTapped(_ sender: Any) {
        goToPage(sender: "https://spectrum.chat/design-code")
    }
    
    @objc private func twitterHandleTapped(_ sender: Any) {
        goToPage(sender: "https://www.instagram.com/codeine.coding/")
    }
    
    private func goToPage(sender: Any) {
        let webController = WebViewController()
        webController.urlString = sender as? String
        let navController = UINavigationController(rootViewController: webController)
        navController.navigationBar.barStyle = .blackTranslucent
        navController.toolbar.barStyle = .blackTranslucent
        present(navController, animated: true, completion: nil)
    }
    
    @objc private func loginBtnPressed() {
        let destination = PurchaseViewController()
        destination.modalPresentationStyle = .overCurrentContext
        destination.modalTransitionStyle = .crossDissolve
        present(destination, animated: true, completion: nil)
    }

}
