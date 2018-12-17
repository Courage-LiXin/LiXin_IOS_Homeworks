//
//  ViewController.swift
//  fourth_2
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 LiXin. All rights reserved.
//

import UIKit

class MyView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        
        UIColor.purple.setFill()
        path.fill()
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let oval = MyView(frame:  CGRect(x: 60, y: 200, width: 300, height: 150))
        oval.backgroundColor = UIColor.clear
        self.view.addSubview(oval)
    }
    
    
    
}

