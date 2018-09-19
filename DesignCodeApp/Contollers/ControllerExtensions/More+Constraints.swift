//
//  More+Constraints.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 8/25/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

extension MoreViewController {
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        displayConstraints()
    }
    
    
    func displayConstraints() {
        // Constraints
        let wRhRConstraints: [NSLayoutConstraint] = [
            dialogView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            dialogView.widthAnchor.constraint(equalToConstant: 600),
        ]
        
        let dialogIphoneConstraints: [NSLayoutConstraint] = [
            dialogView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            dialogView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
        ]
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            dialogView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            dialogView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            dialogView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            sizingView.topAnchor.constraint(equalTo: dialogView.topAnchor),
            sizingView.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor),
            sizingView.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor),
            sizingView.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor),
            
            myProgressLabel.topAnchor.constraint(equalTo: sizingView.topAnchor, constant: 20),
            myProgressLabel.centerXAnchor.constraint(equalTo: sizingView.centerXAnchor),
            
            
            iosdesignView.heightAnchor.constraint(equalToConstant: 70),
            
            progressRing1.centerXAnchor.constraint(equalTo: iosdesignView.centerXAnchor),
            progressRing1.centerYAnchor.constraint(equalTo: iosdesignView.centerYAnchor),
            progressRing1.heightAnchor.constraint(equalToConstant: 70),
            progressRing1.widthAnchor.constraint(equalToConstant: 70),
            
            progressLabel1.centerXAnchor.constraint(equalTo: iosdesignView.centerXAnchor),
            progressLabel1.centerYAnchor.constraint(equalTo: iosdesignView.centerYAnchor),
            
            sketchView.heightAnchor.constraint(equalToConstant: 70),
            
            progressRing2.centerXAnchor.constraint(equalTo: sketchView.centerXAnchor),
            progressRing2.centerYAnchor.constraint(equalTo: sketchView.centerYAnchor),
            progressRing2.heightAnchor.constraint(equalToConstant: 70),
            progressRing2.widthAnchor.constraint(equalToConstant: 70),
            
            progressLabel2.centerXAnchor.constraint(equalTo: sketchView.centerXAnchor),
            progressLabel2.centerYAnchor.constraint(equalTo: sketchView.centerYAnchor),
            
            xcodeView.heightAnchor.constraint(equalToConstant: 70),
            
            progressRing3.centerXAnchor.constraint(equalTo: xcodeView.centerXAnchor),
            progressRing3.centerYAnchor.constraint(equalTo: xcodeView.centerYAnchor),
            progressRing3.heightAnchor.constraint(equalToConstant: 70),
            progressRing3.widthAnchor.constraint(equalToConstant: 70),
            
            progressLabel3.centerXAnchor.constraint(equalTo: xcodeView.centerXAnchor),
            progressLabel3.centerYAnchor.constraint(equalTo: xcodeView.centerYAnchor),
            
            ringStack.topAnchor.constraint(equalTo: myProgressLabel.bottomAnchor, constant: 8),
            ringStack.leadingAnchor.constraint(equalTo: sizingView.leadingAnchor, constant: 20),
            ringStack.trailingAnchor.constraint(equalTo: sizingView.trailingAnchor, constant: -20),
            
            
            actionStack.topAnchor.constraint(equalTo: ringStack.bottomAnchor, constant: 20),
            actionStack.leadingAnchor.constraint(equalTo: sizingView.leadingAnchor),
            actionStack.trailingAnchor.constraint(equalTo: sizingView.trailingAnchor),
            
            epilogueLabel.topAnchor.constraint(equalTo: actionStack.bottomAnchor, constant: 34),
            epilogueLabel.centerXAnchor.constraint(equalTo: sizingView.centerXAnchor),
            epilogueLabel.widthAnchor.constraint(equalToConstant: 170),
            
            twitterBtn.topAnchor.constraint(equalTo: epilogueLabel.bottomAnchor, constant: 15),
            twitterBtn.centerXAnchor.constraint(equalTo: sizingView.centerXAnchor),
            twitterBtn.bottomAnchor.constraint(equalTo: sizingView.bottomAnchor, constant: -15),
            twitterBtn.widthAnchor.constraint(equalToConstant: 170),
        ])
        
        // wR hR == Ipad
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.activate(wRhRConstraints)
        } else {
            NSLayoutConstraint.activate(dialogIphoneConstraints)
        }
        
        // converts action stack to a 2x3 stack view on ipads and iphones in landscape mode
        if traitCollection.horizontalSizeClass == .regular || traitCollection.verticalSizeClass == .compact {
            if topStack.axis == .vertical {
                topStack.axis = .horizontal
                middleStack.axis = .horizontal
                bottomStack.axis = .horizontal
            }
        } else {
            if topStack.axis == .horizontal {
                topStack.axis = .vertical
                middleStack.axis = .vertical
                bottomStack.axis = .vertical
            }
        }
        
    }
    
}
