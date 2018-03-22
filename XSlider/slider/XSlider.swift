//
//  XSlider.swift
//  XSlider
//
//  Created by Xudong on 2018/3/21.
//  Copyright © 2018年 Evenki. All rights reserved.
//

import UIKit

@IBDesignable
class XSlider: UIControl {

  private var trackView: UIView!

  fileprivate var mainLineColor: UIColor?
  fileprivate var mainLineWidth: Float = 0
  fileprivate var count: Int = 1
  fileprivate var minValue: Float = 0
  fileprivate var maxValue: Float = 1

  private let padding: CGFloat = 10

  private lazy var stepValue: Float = {
    return (maxValue - minValue) / Float(count)
  }()

  open var value: Float = 0 {
    didSet {
      updateSlider(value)
    }
  }

  private var stepV: Float {
    return (maxmumValue - minimumValue) / Float(count)
  }

  private var lineY: CGFloat {
    return self.bounds.height * 2 / 3
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

  override init(frame: CGRect) {
    super.init(frame: frame)
    configUI()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configUI()
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)
    let penColor = mainLineColor ?? UIColor.darkGray

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
    trackView.center = CGPoint(x: padding, y: lineY)
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

  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let rect = CGRect(x: trackView.frame.origin.x,
                      y: trackView.frame.origin.y,
                      width: trackView.frame.width + 15,
                      height: trackView.frame.height)
    if rect.contains(point) {
      return trackView
    }
    return nil
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    trackView.alpha = 0.8
    trackView.layer.backgroundColor = UIColor.gray.cgColor
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let endPoint = touch.location(in: self)
    if endPoint.x < minX || endPoint.x > maxX { return }
    trackView.center = CGPoint(x: endPoint.x, y: lineY)
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    trackView.alpha = 1
    trackView.layer.backgroundColor = UIColor.white.cgColor
    guard let touch = touches.first else { return }
    let endPoint = touch.location(in: self)
    if endPoint.x < minX || endPoint.x > maxX { return }
    let index = round((endPoint.x - minX) / stepW)
    self.value = self.minimumValue + self.stepValue * Float(index)
  }

  private func updateSlider(_ value: Float, _ animated: Bool = true) {
    if value > maxmumValue || value < minimumValue { return }
    let index = round(value / stepValue)
    let currentX = CGFloat(stepW * CGFloat(index)) + minX
    UIView.animate(withDuration: 0.1) { [unowned self] in
      self.trackView.center = CGPoint(x: currentX, y: self.lineY)
      self.sendActions(for: .valueChanged)
    }
  }
}

extension XSlider {
  @IBInspectable var minimumValue: Float {
    set { self.minValue = newValue }
    get { return minValue }
  }

  @IBInspectable var maxmumValue: Float {
    set { self.maxValue = newValue }
    get { return maxValue }
  }

  @IBInspectable var lineColor: UIColor? {
    set { self.mainLineColor = newValue }
    get { return mainLineColor }
  }

  @IBInspectable var lineWidth: Float {
    set { self.mainLineWidth = newValue }
    get { return mainLineWidth }
  }

  @IBInspectable var scaleCount: Int {
    set { self.count = newValue }
    get { return count }
  }
}
