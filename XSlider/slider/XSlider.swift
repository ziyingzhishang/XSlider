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

  var trackView: UIView!

  fileprivate var mainLineColor: UIColor?
  fileprivate var mainLineWidth: Float = 0
  fileprivate var mainLineScaleCount: Int = 1

  private let padding: CGFloat = 10

  private lazy var lineY: CGFloat = {
    return self.bounds.height * 2 / 3
  }()

  private lazy var minX: CGFloat = {
    return padding
  }()

  private lazy var maxX: CGFloat = {
    return self.frame.width - padding
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

    let scaleCount = mainLineScaleCount + 2
    let stepW = (self.bounds.width - (2 * padding)) / CGFloat(mainLineScaleCount)
    let scaleLineFromY = lineY - 5
    let scaleLineToY = lineY + 5
    for scale in 0..<scaleCount {
      let scaleLineX = CGFloat(scale) * stepW + padding
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
    trackView.center = CGPoint(x: endPoint.x, y: lineY)
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    trackView.alpha = 1
    trackView.layer.backgroundColor = UIColor.white.cgColor
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
