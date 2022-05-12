//
//  SpinningCircleView.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 21.04.2022.
//

import UIKit

class SpinningCircleView: UIView {
    
    let spinningCircle = CAShapeLayer()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        frame = CGRect(
            x: 0,
            y: 0,
            width: 50,
            height: 50)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinningCircle.path = circularPath.cgPath
        spinningCircle.fillColor = UIColor.clear.cgColor
        spinningCircle.strokeColor = UIColor.systemRed.cgColor
        spinningCircle.lineWidth = 5
        spinningCircle.strokeEnd = 0.25
        spinningCircle.lineCap = .round
        
        self.layer.addSublayer(spinningCircle)
        
    }
    
    func animate() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            
            self.transform = CGAffineTransform(rotationAngle: .pi)
            
        }) { (completed) in
            
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                
                self.transform = CGAffineTransform(rotationAngle: 0)
                
            }) { (completed) in
                
                self.animate()
                
            }
            
        }
        
    }
    
}
