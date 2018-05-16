//
//  ViewControllerProvider.swift
//  PresentationGuessThePet
//
//  Created by Jon Olivet on 9/28/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

protocol ViewControllerProvider {
  var initialViewController: UIViewController { get }
  func viewControllerAtIndex(index: Int) -> UIViewController?
}
