//
//  ViewController.swift
//  ImageControl
//
//  Created by Masaki Horimoto on 2015/04/14.
//  Copyright (c) 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageBeHereNow: UIImageView!
    var startPoint: CGPoint?
    var imageBeHereNowPoint: CGPoint?
    var isImageInside: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageBeHereNow.image = UIImage(named: "BeHereNow.jpg")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("\(__FUNCTION__) is called!!")
        
        // タッチをやり始めた座標を取得
        let touch: UITouch = touches.first as! UITouch
        startPoint = touch.locationInView(self.view)
        //println("startPoint =\(startPoint)")
        
        // タッチをやり始めた時のイメージの座標を取得
        imageBeHereNowPoint = self.imageBeHereNow.frame.origin
        //println("imageBeHereNowPoint =\(imageBeHereNowPoint)")
        
        // イメージの範囲
        let MinX = imageBeHereNowPoint!.x
        let MaxX = imageBeHereNowPoint!.x + self.imageBeHereNow!.frame.width
        let MinY = imageBeHereNowPoint!.y
        let MaxY = imageBeHereNowPoint!.y + self.imageBeHereNow!.frame.height
        
        // イメージの範囲内をタッチした時のみisImageInsideをtrueにする
        if (MinX <= startPoint!.x && startPoint!.x <= MaxX) && (MinY <= startPoint!.y && startPoint!.y <= MaxY) {
            println("Inside of Image")
            isImageInside = true
            
        } else {
            println("Outside of Image")
            isImageInside = false
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("\(__FUNCTION__) is called!!")
        
        if isImageInside! {
            // タッチ中の座標を取得
            let touch: UITouch = touches.first as! UITouch
            let location: CGPoint = touch.locationInView(self.view)
            //println("location =\(location)")
            
            // 移動量を計算
            let deltaX: CGFloat = CGFloat(location.x - startPoint!.x)
            let deltaY: CGFloat = CGFloat(location.y - startPoint!.y)
            //println("deltaX: \(deltaX), deltaY: \(deltaY)")
            
            // イメージを移動
            self.imageBeHereNow.frame.origin.x = imageBeHereNowPoint!.x + deltaX
            self.imageBeHereNow.frame.origin.y = imageBeHereNowPoint!.y + deltaY
        } else {
            // Do nothing
        }
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("\(__FUNCTION__) is called!!")
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        //println("\(__FUNCTION__) is called!!")
    }


}

