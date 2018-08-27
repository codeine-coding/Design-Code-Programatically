//
//  PurchaseViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 8/19/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView(frame: UIScreen.main.bounds)
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    let dialogView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    let blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    let purchaseBackgroundView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Purchase-Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let alignmentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isHidden = false
        return view
    }()
    
    let getBookLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Get the entire book"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let sketchDiscountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "plus, 20% off Sketch. More"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.9607843137, green: 0.8392156863, blue: 1, alpha: 1)
        return label
    }()
    
    // BENEFITS STACK
    let benefitsStackContainer: UIVisualEffectView = {
        let blur = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    let benefitVideoBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("44 hours", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setImage(UIImage(named: "Benefit-Video-small"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    let benefitFilesBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("10GB files", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setImage(UIImage(named: "Benefit-Files-small"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    let videoFilesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    let offlineBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Offline", for: .normal)
        btn.setImage(UIImage(named: "Benefit-Offline-small"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    let wordsBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("100k words", for: .normal)
        btn.setImage(UIImage(named: "Benefit-Words-small"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    let offlineWordsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    let iosWebBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("iOS, Web", for: .normal)
        btn.setImage(UIImage(named: "Benefit-iOS-small"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    let exercisesBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Exercises", for: .normal)
        btn.setImage(UIImage(named: "Benefit-Exercises-small"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    let webExercisesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    let benefitsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    // PRICING ELEMENT TEIR ONE
    let pricingViewT1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    // PRICING ELEMENT TEIR TWO
    let pricingViewT2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    // PRICING ELEMENT TEIR THREE
    let pricingViewT3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    // PRICING ELEMENT STACK
    let pricingElementStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    // RESTORE PURCHASE
    let restorePurchaseBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Restore Purchases", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return btn
    }()
    
    // TEMRS OF SUBSCRIPTION
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reocurring billing, cancel anytime."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .darkGray
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.text = "If you choose to purchase a subscription, payment will be charged to your iTunes account, and your account will be charged within 24-hour to the end of the current period. Auto-renewal may be turned off at any time by going to your setting in your iTunes store after purchase. For more information, please visit our Terms of Service and Privacy Policy."
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        view.addSubview(blurView)
        view.addSubview(scrollView)
        scrollView.addSubview(dialogView)
        dialogView.addSubview(innerView)
        innerView.addSubview(purchaseBackgroundView)
        innerView.addSubview(alignmentView)
        innerView.addSubview(getBookLabel)
        innerView.addSubview(sketchDiscountLabel)
        innerView.addSubview(benefitsStackContainer)
        benefitsStackContainer.contentView.addSubview(benefitsStackView)
        videoFilesStack.addArrangedSubview(benefitVideoBtn)
        videoFilesStack.addArrangedSubview(benefitFilesBtn)
        
        offlineWordsStack.addArrangedSubview(offlineBtn)
        offlineWordsStack.addArrangedSubview(wordsBtn)
        
        webExercisesStack.addArrangedSubview(iosWebBtn)
        webExercisesStack.addArrangedSubview(exercisesBtn)
        
        benefitsStackView.addArrangedSubview(videoFilesStack)
        benefitsStackView.addArrangedSubview(offlineWordsStack)
        benefitsStackView.addArrangedSubview(webExercisesStack)
        
        pricingElementStackView.addArrangedSubview(pricingViewT1)
        pricingElementStackView.addArrangedSubview(pricingViewT2)
        pricingElementStackView.addArrangedSubview(pricingViewT3)
        
        innerView.addSubview(pricingElementStackView)
        innerView.addSubview(restorePurchaseBtn)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            dialogView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            dialogView.heightAnchor.constraint(equalToConstant: 600),
            dialogView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            innerView.topAnchor.constraint(equalTo: dialogView.topAnchor, constant: 0),
            innerView.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor, constant: 0),
            innerView.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 0),
            innerView.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor, constant: 0),
            
            purchaseBackgroundView.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 0),
            purchaseBackgroundView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: 0),
            purchaseBackgroundView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 0),
            purchaseBackgroundView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: 0),
            
            alignmentView.topAnchor.constraint(equalTo: innerView.topAnchor),
            alignmentView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            alignmentView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            alignmentView.widthAnchor.constraint(equalToConstant: 300),
            
            getBookLabel.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 20),
            getBookLabel.leadingAnchor.constraint(equalTo: alignmentView.leadingAnchor),
            getBookLabel.trailingAnchor.constraint(equalTo: alignmentView.trailingAnchor),
            
            sketchDiscountLabel.topAnchor.constraint(equalTo: getBookLabel.bottomAnchor, constant: 5),
            sketchDiscountLabel.leadingAnchor.constraint(equalTo: alignmentView.leadingAnchor),
            sketchDiscountLabel.trailingAnchor.constraint(equalTo: alignmentView.trailingAnchor),
            
            benefitsStackContainer.topAnchor.constraint(equalTo: sketchDiscountLabel.bottomAnchor, constant: 20),
            benefitsStackContainer.leadingAnchor.constraint(equalTo: alignmentView.leadingAnchor),
            benefitsStackContainer.trailingAnchor.constraint(equalTo: alignmentView.trailingAnchor),
            benefitsStackContainer.heightAnchor.constraint(equalToConstant: 134),
            
            benefitsStackView.topAnchor.constraint(equalTo: benefitsStackContainer.topAnchor),
            benefitsStackView.bottomAnchor.constraint(equalTo: benefitsStackContainer.bottomAnchor),
            benefitsStackView.leadingAnchor.constraint(equalTo: benefitsStackContainer.leadingAnchor),
            benefitsStackView.trailingAnchor.constraint(equalTo: benefitsStackContainer.trailingAnchor),
            
           pricingElementStackView.topAnchor.constraint(equalTo: benefitsStackView.bottomAnchor, constant: 20),
           pricingElementStackView.leadingAnchor.constraint(equalTo: alignmentView.leadingAnchor),
           pricingElementStackView.trailingAnchor.constraint(equalTo: alignmentView.trailingAnchor),
           
           restorePurchaseBtn.topAnchor.constraint(equalTo: pricingElementStackView.bottomAnchor, constant: 12),
           restorePurchaseBtn.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -12),
           restorePurchaseBtn.centerXAnchor.constraint(equalTo: alignmentView.centerXAnchor),
           
           titleLabel.topAnchor.constraint(equalTo: dialogView.bottomAnchor, constant: 15),
           titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
           
           contentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
           contentTextView.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor),
           contentTextView.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor),
           contentTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            
            
        ])
        
        
        // hR
        if traitCollection.verticalSizeClass == .regular {
            dialogView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
            
        }
        
        // hC
        if traitCollection.verticalSizeClass == .compact {
            dialogView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        }
        
        // wC
        if traitCollection.horizontalSizeClass == .compact {
            
        }
        
        // wR
        if traitCollection.horizontalSizeClass == .regular {
            dialogView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        }
        
        
        // wC hC
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact {
            dialogView.widthAnchor.constraint(equalToConstant: 500).isActive = true
            
        }
        // wC hR
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            dialogView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
            
        }
        updateViewConstraints()
        
    }

}
