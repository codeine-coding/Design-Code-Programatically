//
//  PresentSectionViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 8/7/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class PresentSectionViewController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var cellFrame: CGRect!
    var cellTransform: CATransform3D!
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let destination = transitionContext.viewController(forKey: .to) as! SectionViewController
        let containerView = transitionContext.containerView
        containerView.addSubview(destination.view)
        
        // Initial State
        let widthConstraint = destination.scrollContentView.widthAnchor.constraint(equalToConstant: 304)
        let heightConstraint = destination.scrollContentView.heightAnchor.constraint(equalToConstant: 248)
        let bottomConstraint = destination.scrollContentView.bottomAnchor.constraint(equalTo: destination.coverImage.bottomAnchor)
        let moveUpTransform = CGAffineTransform(translationX: 0, y: -100)
        let scaleUpTranform = CGAffineTransform(scaleX: 2, y: 2)
        let removeFromViewTransform = moveUpTransform.concatenating(scaleUpTranform)
        
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, bottomConstraint])
        
        let translate = CATransform3DMakeTranslation(cellFrame.origin.x, cellFrame.origin.y, 0.0)
        let tranform = CATransform3DConcat(translate, cellTransform)
        
        destination.view.layer.transform = tranform
        destination.view.layer.zPosition = 999
        destination.scrollContentView.layer.cornerRadius = 14
        destination.scrollContentView.layer.shadowOpacity = 0.25
        destination.scrollContentView.layer.shadowOffset.height = 10
        destination.scrollContentView.layer.shadowRadius = 20
        destination.btnCloseView.alpha = 0
        destination.btnCloseView.transform = removeFromViewTransform
        
        destination.progressView.alpha = 0
        destination.progressView.transform = removeFromViewTransform

        containerView.layoutIfNeeded()
        
        
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.7, animations: {
            // final state
            let scaleTitleTranform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            let moveTitleTransform = CGAffineTransform(translationX: 30, y: 10)
            let titleTranform = scaleTitleTranform.concatenating(moveTitleTransform)
            
            NSLayoutConstraint.deactivate([widthConstraint, heightConstraint, bottomConstraint])
            destination.view.layer.transform = CATransform3DIdentity
            destination.scrollContentView.layer.cornerRadius = 0
            destination.btnCloseView.alpha = 1
            destination.btnCloseView.transform = .identity
            
            destination.progressView.alpha = 1
            destination.progressView.transform = .identity
            
            destination.titleLabel.transform = titleTranform
            containerView.layoutIfNeeded()
        })
        
        animator.addCompletion { (finished) in
            // completion
            transitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
    }
    

}
