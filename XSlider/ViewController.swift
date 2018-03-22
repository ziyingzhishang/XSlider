//
//  ViewController.swift
//  XSlider
//
//  Created by Xudong on 2018/3/21.
//  Copyright © 2018年 Evenki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak private var slider: XSlider!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func resetValue(_ sender: Any) {
    slider.value = 10
  }
  @IBAction func valueChanged(_ sender: Any) {
    guard let slider = sender as? XSlider else { return }
    print("\(slider.value)======")
  }
}

