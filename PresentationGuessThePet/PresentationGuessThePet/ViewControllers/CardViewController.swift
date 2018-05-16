//
//  CardViewController.swift
//  PresentationGuessThePet
//
//  Created by Jon Olivet on 9/28/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

private let revealSequeId = "revealSegue"

class CardViewController: UIViewController {
  
  @IBOutlet private weak var cardView: UIView!
  @IBOutlet private weak var titleLabel: UILabel!
  
  var pageIndex: Int?
  var petCard: PetCard?
  private let flipPresentAnimationController = FlipPresentAnimationController()
  private let flipDismissAnimationController = FlipDismissAnimationController()
  private let swipeInteractionController = SwipeInteractionController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    titleLabel.text = petCard?.description
    cardView.layer.cornerRadius = 25
    cardView.layer.masksToBounds = true
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    cardView.addGestureRecognizer(tapRecognizer)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == revealSequeId, let destinationViewController = segue.destination as? RevealViewController {
      destinationViewController.petCard = petCard
      destinationViewController.transitioningDelegate = self
      swipeInteractionController.wireToViewController(viewController: destinationViewController)
    }
  }
  
  @objc func handleTap() {
    performSegue(withIdentifier: revealSequeId, sender: nil)
  }
}

extension CardViewController: UIViewControllerTransitioningDelegate {
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    flipPresentAnimationController.originFrame = cardView.frame
    return flipPresentAnimationController
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    flipDismissAnimationController.destinationFrame = cardView.frame
    return flipDismissAnimationController
  }
  
  func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return swipeInteractionController.interactionInProgress ? swipeInteractionController : nil
  }
}
