//
//  popAnimator.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/21/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import Foundation
import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning{
    let duration = 2.0
    var originFrame = CGRect.zero
    var finalFrame: CGRect!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        let initialFrame = originFrame
        //let finalFrame = toView.frame
        
        let xScaleFactor = -(originFrame.width/finalFrame.width)
        let yScaleFactor = -(originFrame.height/finalFrame.height)
        print(initialFrame,finalFrame,xScaleFactor,yScaleFactor)
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor,
                                               y: yScaleFactor)
        
        
        toView.transform = scaleTransform
        toView.center = CGPoint(
            x: initialFrame.midX,
            y: initialFrame.midY)
        toView.clipsToBounds = true
        
        
        containerView.addSubview(toView)
        containerView.bringSubview(toFront: toView)
        
        UIView.animate(withDuration: duration,
                       animations: {
                        toView.transform = CGAffineTransform.identity
                        toView.center = CGPoint(x: self.finalFrame.midX, y: self.finalFrame.midY)
        },
                       completion: { _ in
                        transitionContext.completeTransition(true)
        }
        )
        
    }
    
    
}
