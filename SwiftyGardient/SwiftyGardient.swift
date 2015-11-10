//
//  SwiftyGardient.swift
//  SwiftyGardient
//
//  Created by Bilal Karim Reffas on 09.11.15.
//  Copyright © 2015 Bilal Karim Reffas. All rights reserved.
//

import UIKit

@IBDesignable class SwiftyGardient : UIView {
    
    
    /// The startColor for the Gardient
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
        didSet{
            setupSwiftyGardient()
        }
    }
    
    /// Thet endColor for the Gardient
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {
        didSet{
            setupSwiftyGardient()
        }
    }
    
    ///Draw the Gardient Horizontal
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupSwiftyGardient()
        }
    }
    
    ///The roundness for the corner
    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet{
            setupSwiftyGardient()
        }
    }
    
    func setupSwiftyGardient() {
        let colors:Array = [startColor.CGColor,endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        gradientLayer.endPoint = isHorizontal ?  CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 1)
        self.setNeedsDisplay()
    }
    

    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSwiftyGardient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSwiftyGardient()
    }
}
