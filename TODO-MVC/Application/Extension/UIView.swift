//
//  UIView.swift
//  MoviesApp
//
//  Created by Mohamed El-Taweel on 5/23/19.
//  Copyright © 2019 Mohamed El-Taweel. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func animateTranslation(oldPosition: CATransform3D,newPosition: CATransform3D,animationDuration: Double = 2){
        let transformLayer = CABasicAnimation(keyPath: "transform")
        transformLayer.fromValue = oldPosition
        transformLayer.toValue = oldPosition
        transformLayer.duration = animationDuration
        transformLayer.repeatCount = 1
        transformLayer.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.layer.add(transformLayer, forKey: "transform")
    }
    
    func showWithTanslationFromLeadingAnimation(animationDuration: Double = 2){
        let transformLayer = CABasicAnimation(keyPath: "transform")
        let oldX = (UIScreen.main.bounds.minX + self.frame.width ) * -1
        transformLayer.fromValue = CATransform3DMakeTranslation(oldX, 0.0, 0.0)
        transformLayer.toValue = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
        transformLayer.duration = animationDuration
        transformLayer.repeatCount = 1
        transformLayer.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.layer.add(transformLayer, forKey: "transform")
    }
    
    func showWithTanslationFromTrailingAnimation(animationDuration: Double = 2){
        let transformLayer = CABasicAnimation(keyPath: "transform")
        let oldX = UIScreen.main.bounds.maxX + self.frame.width
        transformLayer.fromValue = CATransform3DMakeTranslation(oldX, 0.0, 0.0)
        transformLayer.toValue = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
        transformLayer.duration = animationDuration
        transformLayer.repeatCount = 1
        transformLayer.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.layer.add(transformLayer, forKey: "transform")
    }
    
    func showWithTanslationFromTopAnimation(animationDuration: Double = 2){
        let transformLayer = CABasicAnimation(keyPath: "transform")
        let oldY = (UIScreen.main.bounds.minY + self.frame.height) * -1
        transformLayer.fromValue = CATransform3DMakeTranslation(0.0, oldY, 0.0)
        transformLayer.toValue = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
        transformLayer.duration = animationDuration
        transformLayer.repeatCount = 1
        transformLayer.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.layer.add(transformLayer, forKey: "transform")
    }
    
    func showWithTanslationFromBottomAnimation(animationDuration: Double = 2){
        let transformLayer = CABasicAnimation(keyPath: "transform")
        let oldY = UIScreen.main.bounds.maxY + self.frame.height
        transformLayer.fromValue = CATransform3DMakeTranslation(0.0, oldY, 0.0)
        transformLayer.toValue = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
        transformLayer.duration = animationDuration
        transformLayer.repeatCount = 1
        transformLayer.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.layer.add(transformLayer, forKey: "transform")
    }
    
    
    func addVerticalGradientLayer(firstColor: UIColor,secondColor: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        gradientLayer.colors = [firstColor.cgColor,secondColor.cgColor]
    }
    
    func addCornerRadiusWithAnimation(radius: Double,animationDuration: Double = 2){
        let cornerRadiusAnimatedLayer = CABasicAnimation(keyPath: "cornerRadius")
        cornerRadiusAnimatedLayer.fromValue = 0
        cornerRadiusAnimatedLayer.toValue = radius
        cornerRadiusAnimatedLayer.duration = animationDuration
        cornerRadiusAnimatedLayer.repeatCount = 1
        self.layer.add(cornerRadiusAnimatedLayer, forKey: "cornerRadius")
    }
    
    func makeViewBlur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
    
    
    
}
