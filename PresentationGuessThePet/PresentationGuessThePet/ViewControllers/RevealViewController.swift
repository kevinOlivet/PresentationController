//
//  RevealViewController.swift
//  PresentationGuessThePet
//
//  Created by Jon Olivet on 9/28/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

class RevealViewController: UIViewController {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var imageView: UIImageView!
  
  var petCard: PetCard?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = petCard?.name
    imageView.image = petCard?.image
  }
  
  @IBAction private func dismissPressed(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}
