//
//  FlipDismissAnimationController.swift
//  PresentationGuessThePet
//
//  Created by Jon Olivet on 9/28/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

class FlipDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
  
  var destinationFrame = CGRect.zero
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.6
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
      let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
    
    let _ = transitionContext.initialFrame(for: fromVC)
    let finalFrame = destinationFrame
    
    let snapshot = fromVC.view.snapshotView(afterScreenUpdates: false)
    snapshot?.layer.cornerRadius = 25
    snapshot?.layer.masksToBounds = true
    
    let containerView = transitionContext.containerView
    containerView.addSubview(toVC.view)
    containerView.addSubview(snapshot!)
    fromVC.view.isHidden = true
    
    AnimationHelper.perspectiveTransformForContainerView(containerView: containerView)
    
    toVC.view.layer.transform = AnimationHelper.yRotation(angle: -Double.pi/2)

    let duration = transitionDuration(using: transitionContext)
    
    UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3, animations: {
        snapshot?.frame = finalFrame
      })
      UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
        snapshot?.layer.transform = AnimationHelper.yRotation(angle: Double.pi/2)
      })
      UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
        toVC.view.layer.transform = AnimationHelper.yRotation(angle: 0.0)
      })
    }) { (_) in
      fromVC.view.isHidden = false
      snapshot?.removeFromSuperview()
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
    
  }
  

  
  

}
