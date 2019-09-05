//
//  LoaderAnimation.swift
//  LoaderAnimation
//
//  Created by Sunita Moond on 05/09/19.
//

import UIKit

public class LoaderAnimation: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public var progressLayer = CAShapeLayer()
    public var backgroundLayer = CAShapeLayer()
    public var progress: Int = 0
    
    /// A UIColor value that contains the color of progress line.
    var progressColor: UIColor = .orange {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    /// A UIColor value that contains the background color of line.
    var backgroundProgressLayer: UIColor = .lightGray {
        didSet {
            progressLayer.strokeColor = backgroundProgressLayer.cgColor
        }
    }
    
    /// A CGFloat value that constains the width of progress line.
    var lineWidth: CGFloat = 8.0 {
        didSet {
            progressLayer.lineWidth = lineWidth
        }
    }
    
    /// A CAShapeLayerLineCap value that constains the line cap of progress line.
    var lineCap: String = kCALineCapRound {
        didSet {
            progressLayer.lineCap = lineCap
        }
    }
    
    /// A TimeInterval value that constains the animation duration.
    var animationDuration: TimeInterval = 0.3
    
    /// A CAMediaTimingFunctionName value that contains the name of timing function.
    var timingFunctionName = kCAMediaTimingFunctionEaseOut
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func createSublayers() {
        backgroundColor = .clear
        
        let centerX = frame.size.width / 2
        let centerY = frame.size.height / 2
        
        let startAngle = -CGFloat.pi / 2.0
        let endAngle: CGFloat = 2 * CGFloat.pi + startAngle
        
        let progressPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY),
                                        radius: frame.size.width / 2,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
        
        backgroundLayer.path = progressPath.cgPath
        backgroundLayer.strokeColor = backgroundProgressLayer.cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = lineWidth
        layer.addSublayer(backgroundLayer)
        
        progressLayer.path = progressPath.cgPath
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd  = 0
        progressLayer.lineCap = lineCap
        layer.addSublayer(progressLayer)
    }
    
    public func createAnimation() {
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd") // 1
        progressAnimation.fromValue = 0.0 // 2
        progressAnimation.toValue = Double(progress) / 100.0 // 3
        progressAnimation.duration = animationDuration
        progressAnimation.timingFunction = .init(name: timingFunctionName)
        progressLayer.strokeEnd = CGFloat(progress) / 100.0 // 4
        progressLayer.add(progressAnimation, forKey: nil) // 5
    }
    
    public func setProgress(to value: Int){
        progress = value
        createAnimation()
    }

}
