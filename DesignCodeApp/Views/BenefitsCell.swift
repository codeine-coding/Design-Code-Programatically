//
//  BenefitsCell.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/15/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class BenefitsCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Benefit-Video")
        return iv
    }()
    
    let subhead: UILabel = {
        let label = UILabel()
        label.text = "Watch and follow"
        label.textColor = .lightGray
        return label
    }()
    let title: UILabel = {
        let label = UILabel()
        label.text = "44 hours of video"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    let body: UILabel = {
        let label = UILabel()
        label.text = "Each section is accompanied with captioned, well-paced videos that will help you follow step by step."
        label.textColor = .darkGray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.sizeToFit()
        return label
    }()
    
    let labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 4
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(image)
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(subhead)
        labelStackView.addArrangedSubview(title)
        labelStackView.addArrangedSubview(body)
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 72),
            image.widthAnchor.constraint(equalToConstant: 72),
            
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            labelStackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
}
