//
//  ViewController.swift
//  fourth_3
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 LiXin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label = UILabel(frame: CGRect(x: 150, y: 300, width: 200, height: 44))
        label.text = "Hello LiXin"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.purple
        self.view.addSubview(label)
        
        btn = UIButton(frame: CGRect(x: 160, y: 500, width: 80, height: 50))
        btn.setTitle("Click", for: .normal)
        btn.backgroundColor = UIColor.purple
        btn.setTitleColor(UIColor.black, for: .highlighted)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(cilcked), for: .touchUpInside)
    }
    
    @IBAction func cilcked() {
        if label.text! == "Clicked" {
            label.text = "Hello LiXin"
            btn.setTitle("Click", for: .normal)
        } else {
            label.text = "Clicked"
            btn.setTitle("Hello", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
