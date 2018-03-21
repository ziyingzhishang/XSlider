//
//  ViewController.swift
//  XSlider
//
//  Created by Xudong on 2018/3/21.
//  Copyright © 2018年 Evenki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var xslider: XSlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    xslider.leftView = UIButton()
    xslider.leftView?.setTitle("Test", for: .normal)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

