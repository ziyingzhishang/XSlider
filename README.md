# XSlider
A very simple and IBDesignable Slider, change value by step .

<p align="center">
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
<a href="https://raw.githubusercontent.com/xmartlabs/Eureka/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat" alt="Swift 4 compatible" /></a>
</p>

<p align="center">
<img src="images/result.png">
</p>

# Contents
* [Next]
* [Requirements]
* [Support]
* [Properties]
* [Usage]
  + [How to use]
* [Autor]
## Requirements
* Xcode 9+
* Swift 3+
## Support
* ios 10.0 *
## Next Plan
- Add label for every scale and let user choose it show or hide

## Properties
- LineColor
- LineWidth
- ScaleCount
- Maxmum Value
- Minimum Value
- value
<p align="center">
<img src="images/features.png"/>
</p>

## Usage
  Use in storeboard or in Your Code like a Apple's UISlider Control.

### Carthage
  Add ``` github "ziyingzhishang/XSlider" "master" ``` in Cartfile of your porject .
### CocoaPod
Add ``` pod 'XSlider' :git=>'https://github.com/ziyingzhishang/XSlider.git' ``` in Podfile of your project .

Use it just like use UISlider , very easy !

### Use in storyboard
+ Drag a UIView to your storyboard and set it to ```XSlider```  type ;
<p align='center'>
<img src="images/storyboard.png" />
</p>

+ Set its properties in right panel of view ;
<p align='center'>
<img src="images/storyboard2.png" />
</p>

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

## Autor
- email: ziyingzhishang@163.com
- QQ: 987942684



