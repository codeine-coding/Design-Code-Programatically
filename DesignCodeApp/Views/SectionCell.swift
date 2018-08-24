//
//  SectionCell.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/30/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class SectionCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 20
        return view
    }()
    
    let secondContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    var cardBackgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "ios11.jpg")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Learn iOS 11 Design"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.numberOfLines = 3
        return label
    }()
    
    var cardDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A complete guide to colors, typography and layout for iOS"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        clipsToBounds = false
        addSubview(containerView)
        containerView.addSubview(secondContainerView)
        secondContainerView.addSubview(cardBackgroundImageView)
        secondContainerView.addSubview(cardTitle)
        secondContainerView.addSubview(cardDescription)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            secondContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            secondContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            secondContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            secondContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            cardBackgroundImageView.topAnchor.constraint(equalTo: secondContainerView.topAnchor),
            cardBackgroundImageView.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor),
            cardBackgroundImageView.trailingAnchor.constraint(equalTo: secondContainerView.trailingAnchor),
            cardBackgroundImageView.bottomAnchor.constraint(equalTo: secondContainerView.bottomAnchor),
            
            cardTitle.topAnchor.constraint(equalTo: secondContainerView.topAnchor, constant: 20),
            cardTitle.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor, constant: 20),
            cardTitle.trailingAnchor.constraint(equalTo: secondContainerView.trailingAnchor, constant: -20),
            
            cardDescription.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor, constant: 20),
            cardDescription.trailingAnchor.constraint(equalTo: secondContainerView.trailingAnchor, constant: -20),
            cardDescription.bottomAnchor.constraint(equalTo: secondContainerView.bottomAnchor, constant: -20),
            
        ])
    }
}
