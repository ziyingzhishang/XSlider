# XSlider
<p align="center">
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
<a href="https://raw.githubusercontent.com/xmartlabs/Eureka/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat" alt="Swift 4 compatible" /></a>
</p>

![](images/result.png)

# Contents
* [Requirements]
* [Properties]
* [Usage]
  + [How to use]
* [Installation]
* [Donate]
## Plan
- Add label for every scale and let you choose it show or hide
- 
## Requirements
* Xcode 9+
* Swift 3+
## Properties
- LineColor
- LineWidth
- ScaleCount
- Maxmum Value
- Minimum Value
- value

![](images/features.png)

## Usage
  Use in storeboard or in Your Code like a Apple's UISlider Control.
```swift
import UIKit

class ViewController: UIViewController {
  @IBOutlet weak private var slider: XSlider!

  @IBAction func valueChanged(_ sender: Any) {
    guard let slider = sender as? XSlider else { return }
    print("\(slider.value)======")
  }
}
```
## Installation

## Donate
![wechat](images/wechat.png)
![alipay](images/alipay.png)

## autor
- email: ziyingzhishang@163.com
- QQ: 987942684



