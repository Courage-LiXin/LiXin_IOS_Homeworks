//
//  ViewController.swift
//  thirteenth_1
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 LiXin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.timerLabel.text = "\(self.count)"
            //            print("timer thread:\(Thread.current)")
            }.fire()
    }
    @IBAction func caculate(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            print("Run thread:\(Thread.current)")
            for i in 1...9999999 {
                sum += i
            }
            DispatchQueue.main.async {
                self.testLabel.text = "\(sum)"
            }
        }
        
    }
    
    
}

