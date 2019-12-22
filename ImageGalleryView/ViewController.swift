//
//  ViewController.swift
//  ImageGalleryView
//
//  Created by tsuf on 2019/12/20.
//  Copyright © 2019 upmer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let scrollView = UIScrollView()
    self.scrollView = scrollView
    view.addSubview(scrollView)
    scrollView.isPagingEnabled = true
    scrollView.frame = view.bounds
    
    scrollView.contentSize = CGSize(width: 3 * view.bounds.width, height: 0)
    
    for i in 0...2 {
      let s = UIScrollView()
      s.delegate = self
      s.frame = CGRect(x: view.bounds.width * CGFloat(i), y: 0, width: view.bounds.width, height: view.bounds.height)
      scrollView.addSubview(s)
      s.maximumZoomScale = 3
      s.minimumZoomScale = 0.5
      let imageView = UIImageView()
      imageView.frame = view.bounds
      imageView.image = UIImage(named: "1.jpeg")
      s.addSubview(imageView)
    }
  }


}

extension ViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return scrollView.subviews.first
  }
}

