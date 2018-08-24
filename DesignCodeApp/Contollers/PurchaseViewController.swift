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
    
    let innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    let alignmentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
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
    
    let benefitsStack: UIVisualEffectView = {
        let blur = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.addSubview(scrollView)
        scrollView.addSubview(dialogView)
        dialogView.addSubview(innerView)
        innerView.addSubview(alignmentView)
        innerView.addSubview(getBookLabel)
        innerView.addSubview(sketchDiscountLabel)
        innerView.addSubview(benefitsStack)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            dialogView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            dialogView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            dialogView.heightAnchor.constraint(equalToConstant: 600),
            dialogView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            innerView.topAnchor.constraint(equalTo: dialogView.topAnchor, constant: 0),
            innerView.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor, constant: 0),
            innerView.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 0),
            innerView.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor, constant: 0),
            
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
            
            benefitsStack.topAnchor.constraint(equalTo: sketchDiscountLabel.bottomAnchor, constant: 20),
            benefitsStack.leadingAnchor.constraint(equalTo: alignmentView.leadingAnchor),
            benefitsStack.trailingAnchor.constraint(equalTo: alignmentView.trailingAnchor),
            benefitsStack.heightAnchor.constraint(equalToConstant: 134),
            
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
