//
//  ExerciseDialogViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/18/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit
import MKRingProgressView

class ExerciseDialogViewController: UIViewController {
    
    let dialogView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 28
        view.clipsToBounds = true
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let correctLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Correct"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You're currently doing"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0%"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        return label
    }()
    
    let progressView: MKRingProgressView = {
        let view = MKRingProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.startColor = #colorLiteral(red: 0.8470588235, green: 0.168627451, blue: 0.8588235294, alpha: 1)
        view.endColor = #colorLiteral(red: 0.4666666667, green: 0.1098039216, blue: 0.7803921569, alpha: 1)
        view.backgroundRingColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let angle: CGFloat = -100.0 * .pi / 180.0
        var rotationTransform = CATransform3DMakeRotation(angle, 0, 1, 0)
        rotationTransform.m34 = -1.0/1000
        
        var translationTransform = CATransform3DMakeTranslation(80, 200, 0)
        translationTransform.m34 = -1.0/2500
        
        let transform = CATransform3DConcat(rotationTransform, translationTransform)
        
        dialogView.layer.transform = transform
        dialogView.alpha = 0
        
        let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.7) {
            self.dialogView.transform = .identity
            self.dialogView.alpha = 1
        }
        animator.startAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        percentageLabel.animateTo(70)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.progressView.animateTo(70)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.dismiss(animated: true)
        }
    }
    
    private func setupView() {
        view.backgroundColor = .clear
        view.addSubview(dialogView)
        dialogView.addSubview(visualEffectView)
        visualEffectView.contentView.addSubview(correctLabel)
        visualEffectView.contentView.addSubview(subLabel)
        visualEffectView.contentView.addSubview(progressView)
        progressView.addSubview(percentageLabel)
        
        NSLayoutConstraint.activate([
            dialogView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dialogView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dialogView.widthAnchor.constraint(equalToConstant: 260),
            dialogView.heightAnchor.constraint(equalToConstant: 260),
            
            visualEffectView.topAnchor.constraint(equalTo: dialogView.topAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor),
            
            correctLabel.topAnchor.constraint(equalTo: visualEffectView.topAnchor, constant: 20),
            correctLabel.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor),
            
            subLabel.topAnchor.constraint(equalTo: correctLabel.bottomAnchor),
            subLabel.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor),
            
            progressView.bottomAnchor.constraint(equalTo: visualEffectView.bottomAnchor, constant: -20),
            progressView.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 146),
            progressView.widthAnchor.constraint(equalToConstant: 146),
            
            percentageLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
        ])
        
    }

}
