//
//  UILabel+Animate.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/18/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

extension UILabel {
    
    func animateTo(_ number : Int) {
        
        guard number > 0 else { return }
        
        let now = DispatchTime.now()
        
        for index in 0...number {
            let milliseconds = 10 * index
            let deadline : DispatchTime = now + .milliseconds(milliseconds)
            
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                self.text = "\(index)%"
            }
        }
    }
}
