//
//  MKProgressView+Animate.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/18/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit
import MKRingProgressView

extension MKRingProgressView {
    func animateTo(_ number : Int) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        
        self.progress = Double(number)/100
        
        CATransaction.commit()
    }
}
