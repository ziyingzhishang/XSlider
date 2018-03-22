//
//  ViewController.swift
//  Demo
//
//  Created by Xudong on 2018/3/22.
//  Copyright © 2018年 Evenki. All rights reserved.
//

import UIKit
import XSlider

class ViewController: UIViewController {

  @IBOutlet weak var slider: XSlider!

  override func viewDidLoad() {
    super.viewDidLoad()
    slider.value = 90
  }

  @IBAction func valueChange(_ sender: Any) {
    guard let slider = sender as? XSlider else { return }
    print(slider.value)
  }
}

