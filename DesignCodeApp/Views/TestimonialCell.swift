//
//  TestimonialCell.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/30/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class TestimonialCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    let testimonialText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Design+Code is a wake-up call. Why should I learn a web based technology or a deprecated tool when the obvious choice is to learn Xcode?"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    let beginQuote: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Quote-Begin.jpg")
        return iv
    }()
    
    let endQuote: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Quote-End.jpg")
        return iv
    }()
    
    let personFullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Allen Whearry"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    let personJobDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sales Professional"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()
    
    let personStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        clipsToBounds = false
        addSubview(containerView)
        containerView.addSubview(testimonialText)
        containerView.addSubview(beginQuote)
        containerView.addSubview(endQuote)
        personStack.addArrangedSubview(personFullName)
        personStack.addArrangedSubview(personJobDescription)
        containerView.addSubview(personStack)
        containerView.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            testimonialText.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            testimonialText.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 54),
            testimonialText.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            beginQuote.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            beginQuote.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            beginQuote.heightAnchor.constraint(equalToConstant: 18),
            beginQuote.widthAnchor.constraint(equalToConstant: 23),
            
            endQuote.bottomAnchor.constraint(equalTo: testimonialText.bottomAnchor),
            endQuote.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7),
            endQuote.heightAnchor.constraint(equalToConstant: 9),
            endQuote.widthAnchor.constraint(equalToConstant: 12),
            
            personStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -14),
            personStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 54),
            personStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            avatarImageView.trailingAnchor.constraint(equalTo: personStack.leadingAnchor, constant: -10),
            avatarImageView.centerYAnchor.constraint(equalTo: personStack.centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 24),
            avatarImageView.widthAnchor.constraint(equalToConstant: 24),
            
        ])
    }
    
}
