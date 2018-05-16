//
//  PageViewController.swift
//  PresentationGuessThePet
//
//  Created by Jon Olivet on 9/28/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
  
  let petCards = PetCardStore.defaultPets()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    setViewControllers([initialViewController], direction: .forward, animated: false, completion: nil)
  }
}

// MARK: Page view controller data source

extension PageViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    if let viewController = viewController as? CardViewController, let pageIndex = viewController.pageIndex, pageIndex > 0 {
      return viewControllerAtIndex(index: pageIndex - 1)
    }
    
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    if let viewController = viewController as? CardViewController, let pageIndex = viewController.pageIndex, pageIndex < petCards.count - 1 {
      return viewControllerAtIndex(index: pageIndex + 1)
    }
    
    return nil
  }
  
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return petCards.count
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return 0
  }
}

// MARK: View controller provider

extension PageViewController: ViewControllerProvider {
  
  var initialViewController: UIViewController {
    return viewControllerAtIndex(index: 0)!
  }
  
  func viewControllerAtIndex(index: Int) -> UIViewController? {
    
    if let cardViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CardViewController") as? CardViewController {
      
      cardViewController.pageIndex = index
      cardViewController.petCard = petCards[index]
      
      return cardViewController
    }
    
    return nil
  }
}
