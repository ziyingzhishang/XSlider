//
//  XSlider.swift
//  XSlider
//
//  Created by Xudong on 2018/3/21.
//  Copyright © 2018年 Evenki. All rights reserved.
//

import UIKit

@IBDesignable
open class XSlider: UIControl {

  private var trackView: UIView!

  fileprivate var mainLineColor: UIColor = UIColor.black
  fileprivate var mainLineWidth: Float = 1
  fileprivate var count: Int = 5
  fileprivate var minValue: Float = 0
  fileprivate var maxValue: Float = 1

  private let padding: CGFloat = 10

  private var currentValue: Float = 0

  open var value: Float {
    set {
      if newValue > maxValue || newValue < minValue { return }
      currentValue = minValue + round(newValue / stepV) * stepV
      updateSlider(currentValue)
    }
    get {
      return currentValue
    }
  }

  open var stepValue: Float {
    get { return stepV }
  }

  private lazy var stepV: Float = {
    return (maxValue - minValue) / Float(count)
  }()

  private var lineY: CGFloat {
    return self.bounds.height / 2
  }

  private var minX: CGFloat {
    return padding
  }

  private var maxX: CGFloat {
    return self.frame.width - padding
  }

  private var stepW: CGFloat {
    return (self.bounds.width - (2 * padding)) / CGFloat(count)
  }

  private var currentX: CGFloat {
    if value > maxValue { return maxX }
    if value < minValue { return minX }
    let index = round(value / stepV)
    return CGFloat(stepW * CGFloat(index)) + minX
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    configUI()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configUI()
  }

  override open func draw(_ rect: CGRect) {
    super.draw(rect)
    let penColor = mainLineColor

    guard let context = UIGraphicsGetCurrentContext() else { return }
    context.setStrokeColor(penColor.cgColor)
    context.setLineWidth(CGFloat(mainLineWidth))
    context.move(to: CGPoint(x: padding, y: lineY))
    context.addLine(to: CGPoint(x: self.bounds.width - padding, y: lineY))
    context.strokePath()

    let scaleCount = count + 2
    let step = stepW
    let scaleLineFromY = lineY - 5
    let scaleLineToY = lineY + 5
    for scale in 0..<scaleCount {
      let scaleLineX = CGFloat(scale) * step + padding
      context.move(to: CGPoint(x: scaleLineX, y: scaleLineFromY))
      context.addLine(to: CGPoint(x: scaleLineX, y: scaleLineToY))
      context.strokePath()
    }
    trackView.center = CGPoint(x: currentX, y: lineY)
  }

  func configUI() {
    trackView = UIView()
    
    trackView.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
    trackView.backgroundColor = UIColor.white
    trackView.layer.borderWidth = 0.33
    trackView.layer.borderColor = UIColor.gray.cgColor
    trackView.layer.cornerRadius = 5

    trackView.layer.shadowColor = UIColor.darkGray.cgColor
    trackView.layer.shadowOffset = CGSize(width: 1, height: 1)
    trackView.layer.shadowOpacity = 0.8

    self.addSubview(trackView)
  }

  override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let rect = CGRect(x: trackView.frame.origin.x,
                      y: trackView.frame.origin.y,
                      width: trackView.frame.width + 15,
                      height: trackView.frame.height)
    if rect.contains(point) {
      return trackView
    }
    return nil
  }

  override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    trackView.alpha = 0.8
    trackView.layer.backgroundColor = UIColor.gray.cgColor
  }

  override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let endPoint = touch.location(in: self)
    if endPoint.x < minX || endPoint.x > maxX { return }
    trackView.center = CGPoint(x: endPoint.x, y: lineY)
  }

  override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    trackView.alpha = 1
    trackView.layer.backgroundColor = UIColor.white.cgColor
    guard let touch = touches.first else { return }
    let endPoint = touch.location(in: self)
    if endPoint.x < minX || endPoint.x > maxX { return }
    let index = round((endPoint.x - minX) / stepW)
    self.value = self.minValue + self.stepV * Float(index)
  }

  private func updateSlider(_ value: Float, _ animated: Bool = true) {
    UIView.animate(withDuration: 0.1) { [unowned self] in
      self.trackView.center = CGPoint(x: self.currentX, y: self.lineY)
      self.sendActions(for: .valueChanged)
    }
  }
}

extension XSlider {
  @IBInspectable open var minimumValue: Float {
    set { self.minValue = newValue }
    get { return minValue }
  }

  @IBInspectable open var maxmumValue: Float {
    set { self.maxValue = newValue }
    get { return maxValue }
  }

  @IBInspectable open var lineColor: UIColor {
    set { self.mainLineColor = newValue }
    get { return mainLineColor }
  }

  @IBInspectable open var lineWidth: Float {
    set { self.mainLineWidth = newValue }
    get { return mainLineWidth }
  }

  @IBInspectable open var scaleCount: Int {
    set { self.count = newValue }
    get { return count }
  }
}
