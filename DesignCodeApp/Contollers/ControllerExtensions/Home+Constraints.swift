//
//  Home+Constraints.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 8/23/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit


extension HomeViewController {
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        displayConstraints()
    }
    
    func displayConstraints() {
        // Constraints
        var compactConstraints: [NSLayoutConstraint] = []
        var regularConstraints: [NSLayoutConstraint] = []
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            
            heroView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            heroView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            heroView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            heroView.heightAnchor.constraint(equalToConstant: 452),
            heroView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            homeImageView.topAnchor.constraint(equalTo: heroView.topAnchor, constant: -50),
            homeImageView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            homeImageView.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            homeImageView.bottomAnchor.constraint(equalTo: heroView.bottomAnchor),
            
            mainTitle.widthAnchor.constraint(equalToConstant: 160),
            mainTitle.heightAnchor.constraint(equalToConstant: 172),
            mainTitle.centerXAnchor.constraint(equalTo: heroView.centerXAnchor, constant: -70),
            mainTitle.centerYAnchor.constraint(equalTo: heroView.centerYAnchor, constant: -34),
            
            phoneImageView.widthAnchor.constraint(equalToConstant: 123),
            phoneImageView.heightAnchor.constraint(equalToConstant: 319),
            phoneImageView.leadingAnchor.constraint(equalTo: mainTitle.trailingAnchor, constant: 4),
            phoneImageView.centerYAnchor.constraint(equalTo: mainTitle.centerYAnchor, constant: 12.5),
            
            videoPlayButtonView.widthAnchor.constraint(equalToConstant: 50),
            videoPlayButtonView.heightAnchor.constraint(equalToConstant: 50),
            videoPlayButtonView.centerXAnchor.constraint(equalTo: phoneImageView.centerXAnchor, constant: -4.5),
            videoPlayButtonView.centerYAnchor.constraint(equalTo: phoneImageView.centerYAnchor, constant: -11.5),
            
            statsView.heightAnchor.constraint(equalToConstant: 128),
            statsView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            statsView.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            statsView.bottomAnchor.constraint(equalTo: heroView.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: statsView.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: statsView.bottomAnchor, constant: -20),
            mainStackView.centerXAnchor.constraint(equalTo: statsView.centerXAnchor),
            
            bookContentView.topAnchor.constraint(equalTo: heroView.bottomAnchor),
            bookContentView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            bookContentView.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            bookContentView.heightAnchor.constraint(equalToConstant: 348),
            
            bookImageView.topAnchor.constraint(equalTo: bookContentView.topAnchor, constant: 50),
            bookImageView.centerXAnchor.constraint(equalTo: bookContentView.centerXAnchor),
            
            bookLabel.centerXAnchor.constraint(equalTo: bookImageView.centerXAnchor),
            bookLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 20),
            bookLabel.widthAnchor.constraint(equalToConstant: 315),
            
            beginnerLabel.centerXAnchor.constraint(equalTo: bookLabel.centerXAnchor),
            beginnerLabel.widthAnchor.constraint(equalTo: bookLabel.widthAnchor),
            beginnerLabel.topAnchor.constraint(equalTo: bookLabel.bottomAnchor),
            
            chapterView.topAnchor.constraint(equalTo: bookContentView.bottomAnchor),
            chapterView.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            chapterView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            chapterView.heightAnchor.constraint(equalToConstant: 380),
            
            chapterLabel.topAnchor.constraint(equalTo: chapterView.topAnchor, constant: 50),
            chapterLabel.leadingAnchor.constraint(equalTo: chapterView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            chapterLabel.trailingAnchor.constraint(equalTo: chapterView.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            
            chapter1collectionView.leadingAnchor.constraint(equalTo: chapterView.leadingAnchor),
            chapter1collectionView.trailingAnchor.constraint(equalTo: chapterView.trailingAnchor),
            chapter1collectionView.bottomAnchor.constraint(equalTo: chapterView.bottomAnchor, constant: -50),
            chapter1collectionView.heightAnchor.constraint(equalToConstant: 248),
            
            testimonialVC.view.topAnchor.constraint(equalTo: chapterView.bottomAnchor),
            testimonialVC.view.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            testimonialVC.view.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            testimonialVC.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            testimonialVC.view.heightAnchor.constraint(equalToConstant: 524),
            
        ])
        
        regularConstraints.append(contentsOf: [
            mainStackView.widthAnchor.constraint(equalToConstant: 450),
        ])
        
        compactConstraints.append(contentsOf: [
            mainStackView.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        if traitCollection.horizontalSizeClass == .regular {
            mainStackView.addArrangedSubview(thirdStackView)
            
        } else {
            mainStackView.removeArrangedSubview(thirdStackView)
            thirdStackView.removeFromSuperview()
        }
        updateViewConstraints()

    }
    
}
