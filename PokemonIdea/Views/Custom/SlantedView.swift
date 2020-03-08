//
//  SlantedView.swift
//  PokemonIdea
//
//  Created by Matt Roberts on 01/03/2020.
//  Copyright © 2020 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class SlantedView: UIView {
  
  private var path = UIBezierPath()
  
  @IBInspectable var slantHeight: CGFloat = 50 { didSet { updatePath() } }
  
  private let shapeLayer: CAShapeLayer = {
    let shapeLayer = CAShapeLayer()
    shapeLayer.lineWidth = 0
    shapeLayer.fillColor = UIColor.white.cgColor
    return shapeLayer
  }()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    updatePath()
  }
  
  private func updatePath() {
    // Top Left
    path.move(to: CGPoint(x: bounds.minX, y: bounds.minY + slantHeight))
    
    // Top Right
    path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
    
    // Bottom Right
    path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
    
    // Bottom Left
    path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
    
    path.close()
    shapeLayer.path = path.cgPath
    layer.mask = shapeLayer
  }
  
}
