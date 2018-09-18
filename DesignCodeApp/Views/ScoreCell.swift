//
//  ScoreCell.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/16/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit
import MKRingProgressView

class ScoreCell: UICollectionViewCell {
    
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.layer.shadowRadius = 10
        view.layer.opacity = 0.15
        return view
    }()
    
    let innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "swift-wallpaper")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3 QUESTIONS IN 6 SECONDS"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        return label
    }()
    
    let subheaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Design Challenge"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 5
        return label
    }()
    
    let progressRingView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ringProgress: MKRingProgressView = {
        let pv = MKRingProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.startColor = #colorLiteral(red: 0.8470588235, green: 0.168627451, blue: 0.8588235294, alpha: 1)
        pv.endColor = #colorLiteral(red: 0.4666666667, green: 0.1098039216, blue: 0.7803921569, alpha: 1)
        pv.backgroundRingColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        pv.ringWidth = 18
        pv.shadowOpacity = 0.25
        return pv
    }()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0%"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You took the exercise 3 times. Your average time is 30 seconds"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        return sv
    }()
    
    let tryVEV: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    let tryButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Try Again", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        btn.layer.shadowRadius = 8
        btn.layer.shadowOpacity = 0.25
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        return btn
    }()
    let shareVEV: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    let shareBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Share", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        btn.layer.shadowRadius = 8
        btn.layer.shadowOpacity = 0.25
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(cardView)
        cardView.addSubview(innerView)
        innerView.addSubview(imageView)
        innerView.addSubview(titleLabel)
        innerView.addSubview(subheaderLabel)
        innerView.addSubview(progressRingView)
        innerView.addSubview(stackView)
        innerView.addSubview(summaryLabel)
        
        progressRingView.addSubview(ringProgress)
        progressRingView.addSubview(percentageLabel)
        
        stackView.addArrangedSubview(tryVEV)
        tryVEV.contentView.addSubview(tryButton)
        
        stackView.addSubview(shareVEV)
        shareVEV.contentView.addSubview(shareVEV)
        
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            innerView.topAnchor.constraint(equalTo: cardView.topAnchor),
            innerView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            innerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            innerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: innerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20),
            
            subheaderLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20),
            subheaderLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20),
            subheaderLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20),
            
            progressRingView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            progressRingView.centerYAnchor.constraint(equalTo: innerView.centerYAnchor),
            progressRingView.heightAnchor.constraint(equalToConstant: 180),
            progressRingView.widthAnchor.constraint(equalToConstant: 180),
            
            ringProgress.centerXAnchor.constraint(equalTo: progressRingView.centerXAnchor),
            ringProgress.centerYAnchor.constraint(equalTo: progressRingView.centerYAnchor),
            ringProgress.heightAnchor.constraint(equalToConstant: 140),
            ringProgress.widthAnchor.constraint(equalToConstant: 140),
            
            percentageLabel.centerXAnchor.constraint(equalTo: progressRingView.centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: progressRingView.centerYAnchor),
            
            stackView.bottomAnchor.constraint(equalTo: summaryLabel.topAnchor, constant: -15),
            stackView.widthAnchor.constraint(equalToConstant: 240),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            
            summaryLabel.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -20),
            summaryLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20),
            summaryLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20),
            
            ])
    }
    
}
