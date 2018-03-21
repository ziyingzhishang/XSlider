//
//  XSlider.swift
//  XSlider
//
//  Created by Xudong on 2018/3/21.
//  Copyright © 2018年 Evenki. All rights reserved.
//

import UIKit

@IBDesignable
class XSlider: UIView {

  var leftView: UIButton?
  var rightView: UIButton?

  var trackView: UIView!

  fileprivate var mainLineColor: UIColor?
  fileprivate var mainLineWidth: Float = 0
  fileprivate var mainLineScaleCount: Int = 1

  private lazy var lineY: CGFloat = {
    return self.bounds.height * 2 / 3
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configUI()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configUI()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    // set leftView and rightView bounds and position

    leftView?.center = CGPoint(x: (leftView?.bounds.width ?? 0) / 2, y: lineY)
    rightView?.center = CGPoint(x: (self.bounds.width - (rightView?.bounds.width ?? 0)) / 2,
                                y: lineY)

    //

  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)
    let penColor = mainLineColor ?? UIColor.darkGray

    guard let context = UIGraphicsGetCurrentContext() else { return }
    context.setStrokeColor(penColor.cgColor)
    context.setLineWidth(CGFloat(mainLineWidth))
    context.move(to: CGPoint(x: 0, y: lineY))
    context.addLine(to: CGPoint(x: self.bounds.width, y: lineY))
    context.strokePath()

    let scaleCount = mainLineScaleCount + 2
    let stepW = self.bounds.width / CGFloat(mainLineScaleCount)
    let scaleLineFromY = lineY - 5
    let scaleLineToY = lineY + 5
    for scale in 0..<scaleCount {
      let scaleLineX = CGFloat(scale) * stepW
      context.move(to: CGPoint(x: scaleLineX, y: scaleLineFromY))
      context.addLine(to: CGPoint(x: scaleLineX, y: scaleLineToY))
      context.strokePath()
    }
  }

  func configUI() {
    self.backgroundColor = UIColor.white
    if leftView != nil {
      self.addSubview(leftView!)
    }
    if rightView != nil {
      self.addSubview(rightView!)
    }
    trackView = UIView()
    self.addSubview(trackView)
  }
}

extension XSlider {
  @IBInspectable var lineColor: UIColor? {
    set { self.mainLineColor = newValue }
    get { return mainLineColor }
  }

  @IBInspectable var lineWidth: Float {
    set { self.mainLineWidth = newValue }
    get { return mainLineWidth }
  }

  @IBInspectable var scaleCount: Int {
    set { self.mainLineScaleCount = newValue }
    get { return mainLineScaleCount }
  }
}
