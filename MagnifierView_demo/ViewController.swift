//
//  ViewController.swift
//  MagnifierView_demo
//
//  Created by lidongxi on 2018/3/23.
//  Copyright © 2018年 lidongxi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let magnifieViewWH : CGFloat = 150
    
    var magnifierView: MagnifierView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        magnifierView = MagnifierView.init(frame: CGRect.zero)
        magnifierView!.scale = 2
        magnifierView!.renderView = view.window
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        // 获取触摸点
        let touch = touches.first!
        let point = touch.location(in: view)
        guard let magnifierV = magnifierView else { return }
        magnifierV.isHidden = false
        
        magnifierV.frame = CGRect.init(x: 0, y: 0, width: magnifieViewWH, height: magnifieViewWH)
        magnifierV.center = point
        
        // 设置渲染的中心点
        magnifierV.renderPoint = point
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        magnifierView = nil
        magnifierView?.removeFromSuperview()
    }
    
    
    


}

